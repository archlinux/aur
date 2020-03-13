# Maintainer: Artur Juraszek <artur@juraszek.xyz>
# Ex-Maintainer: Gonzalo Ciruelos <gonzalo.ciruelos@gmail.com>
# Ex-Maintainer: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Nicolas Floquet <nicolasfloquet AT gmail DOT com>
pkgname=e2tools
pkgver=0.1.0
pkgrel=3
pkgdesc="A simple set of GPL'ed utilities to read, write, and manipulate files in an ext2/ext3 filesystem."
arch=('i686' 'x86_64')
url="https://github.com/e2tools/e2tools/"
license=('GPL')
depends=('e2fsprogs')
options=(!buildflags)
source=(https://github.com/e2tools/e2tools/releases/download/v$pkgver/e2tools-$pkgver.tar.gz)
sha256sums=('c1a06b5ae2cbddb6f04d070e889b8bebf87015b8585889999452ce9846122edf')
b2sums=('62a1e478b71e9105274ba8b815f1f4765ecc05593de481c4ef384ff9463a0be811efe5f37bd3509393dfd3bdfb0103625e192ebcce52cbf896a6f7758cb50884')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make CPPFLAGS="-Wall"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
