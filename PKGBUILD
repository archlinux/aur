# Maintainer: Alex Indigo <ai@aegis.one>
pkgname=kosmozoo-bin; pkgver=0.4.0; pkgrel=1
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
sha256sums=('8d60550a14a4c40a755acfa89abf723621d3cd03cfafdd9bf4e9a2109d4277b9')
package() {
  install -Dm755 "kosmozoo-$pkgver" "$pkgdir/usr/bin/kosmozoo"
  "$pkgdir/usr/bin/kosmozoo" package-resources --prefix=/usr --destdir="$pkgdir"
}
