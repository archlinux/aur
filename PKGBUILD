# Maintainer: Alex Indigo <ai@aegis.one>
pkgname=kosmozoo-bin; pkgver=0.4.1; pkgrel=1
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
sha256sums=('b116a32e4b093d4c422277f37cfdfd3eea85d417158ec03dd409cd3f5025f88c')
package() {
  install -Dm755 "kosmozoo-$pkgver" "$pkgdir/usr/bin/kosmozoo"
  "$pkgdir/usr/bin/kosmozoo" package-resources --prefix=/usr --destdir="$pkgdir"
}
