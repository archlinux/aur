# Maintainer: Emil Vanherp <emil DOT vanherp AT hot mail DOT com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Valère Monseur <valere DOT monseur AT ymail·com>

pkgname=eid-viewer
pkgver=4.1.18
pkgrel=1

pkgdesc="Viewer for Belgian Electronic Identity Card"
arch=('i686' 'x86_64')
url="http://eid.belgium.be/"
license=('LGPL3')

depends=('java-runtime' 'gsettings-desktop-schemas' 'eid-mw')
source=("https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.src.tar.gz")
sha256sums=('00946bef872457d31543a0c0a608b3e99148dcfe0e2e0bcbbf9a420a5beaa9ab')
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
