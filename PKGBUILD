# Maintainer: Alex Indigo <ai@aegis.one>
pkgname=kosmozoo-bin; pkgver=0.3.1; pkgrel=1
pkgdesc="Local review and curation app for ComfyUI image output (prebuilt executable)"
arch=('x86_64')
url="https://github.com/alexindigo/kosmozoo"
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc' 'hicolor-icon-theme')
optdepends=('chromium: app window' 'google-chrome: app window' 'brave-bin: app window' 'firefox: app window')
install=kosmozoo.install
provides=('kosmozoo'); conflicts=('kosmozoo' 'kosmozoo-git')
options=('!strip' '!debug')
source=("kosmozoo-$pkgver::$url/releases/download/v$pkgver/kosmozoo-linux-x86_64")
sha256sums=('c65a3e5a2676e843a80e182e6215202cda5ef287ca6fb49c2378e6b1b455aae1')
package() {
  install -Dm755 "kosmozoo-$pkgver" "$pkgdir/usr/bin/kosmozoo"
  "$pkgdir/usr/bin/kosmozoo" package-resources --prefix=/usr --destdir="$pkgdir"
}
