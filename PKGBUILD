# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgbase=guile-dbi
pkgname=guile-dbi
pkgver=2.1.9
pkgrel=1
pkgdesc='A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL2')
depends=('guile')
source=("${url}/archive/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('25C38FE7E7176B4340951093FCBD13A9E6532D76399310CB6DF19E169EC19347')
options=(!strip)

build () {
  cd "${srcdir}/$pkgbase-$pkgbase-$pkgver/${pkgbase}"
  ./autogen.sh --no-configure
  mkdir build
  cd build
  ../configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/$pkgbase-$pkgbase-$pkgver/${pkgbase}/build"
  make DESTDIR=$pkgdir install
}
