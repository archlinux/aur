# Maintainer: Emil Vanherp <emil DOT vanherp AT hot mail DOT com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Valère Monseur <valere DOT monseur AT ymail·com>

pkgname=eid-viewer
pkgver=4.1.13
pkgrel=1

pkgdesc="Viewer for Belgian Electronic Identity Card"
arch=('i686' 'x86_64')
url="http://eid.belgium.be/"
license=('LGPL3')

depends=('java-runtime' 'gsettings-desktop-schemas' 'eid-mw')
source=("https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.src.tar.gz")
sha256sums=('8a4f7ae34558b2b858851a233f3d0b968be1daf091ece0adc04cfa5a7b74cddc')
install=eid-viewer.install

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
