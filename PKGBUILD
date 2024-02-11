# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.36
pkgrel=1
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD')
depends=('libglibutil' 'glib2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mer-hybris/libgbinder/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('5727b25299286e8238a9b526fec9f72d631f584cabb21021d9f12e550059fe746e1165d5bb47ba79db52e2ccb5a3ce96dbd97761df78f13cf7e9a1554d1c3876')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
