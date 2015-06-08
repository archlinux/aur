# Maintainer: Severen Redwood <severen.redwood@gmail.com>
# Contributors: Dave Reisner <dreisner@archlinux.org>
#               Matthias Blaicher <matthias@blaicher.com>
pkgname=capnproto
pkgver=0.5.2
pkgrel=3
pkgdesc="Cap'n Proto serialization/RPC system"
arch=('i686' 'x86_64')
url="http://kentonv.github.io/capnproto/"
license=('MIT')
makedepends=('git')
conflicts=('capnproto-git')
source=("http://capnproto.org/capnproto-c++-${pkgver}.tar.gz")
md5sums=('84dcb55dba3f60b0f85734fd0e502401')

build() {
  cd "${srcdir}/capnproto-c++-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/capnproto-c++-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/capnproto-c++-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
