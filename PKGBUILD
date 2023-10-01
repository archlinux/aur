# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.34
pkgrel=2
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD')
depends=('libglibutil' 'glib2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mer-hybris/libgbinder/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a93e3d123b76dab2e9b4b7d53a844303687f058aa76bf5619945fce99f7df09404c13686b9134674daa79a5ae570e27ad156099985160322246dc73482454785')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
