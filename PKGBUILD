# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.38
pkgrel=1
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD')
depends=('libglibutil' 'glib2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mer-hybris/libgbinder/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('610dbe962287278de0e3549b4f7d15f6af0017afa0da356f6a72550c8d5c9925960527a30fd4d4e66c64f9cfd63915ba60b990220e350fee935bef5bf5a17710')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
