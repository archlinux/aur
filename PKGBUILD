# Maintainer: Alex Indigo <ai@aegis.one>
pkgname=kosmozoo-bin; pkgver=0.3.0; pkgrel=1
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
sha256sums=('ff2486bfd42f0c50c0e48eb08a52ac9ec8eee826f873629e6e4cad90d0179d34')
package() {
  install -Dm755 "kosmozoo-$pkgver" "$pkgdir/usr/bin/kosmozoo"
  "$pkgdir/usr/bin/kosmozoo" package-resources --prefix=/usr --destdir="$pkgdir"
}
