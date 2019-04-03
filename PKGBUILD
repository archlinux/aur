# Maintainer: Tom Gundersen <teg@jklm.no>
pkgname="bootchart"
pkgver=1.20
pkgrel=3
pkgdesc="A 'startup' graphing tool"
url="https://github.com/sofar/bootchart"
license=('GPL2')
arch=(x86_64)
depends=('glibc')
source=("http://foo-projects.org/~sofar/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sbindir=/usr/bin

   make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
sha512sums=('c42f30b5f330be9c1877de051ffe4b840662da43b224e659d948d278c65c23dc5c1a4f5f122a42751157e31dc1cb77ce89b6b8627206ea58485cdb732a269803')
