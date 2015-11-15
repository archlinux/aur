# Maintainer: Emil Vanherp <emil DOT vanherp AT hot mail DOT com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Valère Monseur <valere DOT monseur AT ymail·com>

pkgname=eid-viewer
pkgver=4.1.9
pkgrel=1

pkgdesc="Viewer for Belgian Electronic Identity Card"
arch=('i686' 'x86_64')
url="http://eid.belgium.be/"
license=('LGPL3')

depends=('java-runtime' 'gsettings-desktop-schemas' 'eid-mw')
source=("https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.src.tar.gz")
sha256sums=('8ff4e0a1c435efa63e08e5dd5d3e10c442ccc36299910f5d03f2243a0995092f')
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
