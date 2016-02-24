# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Dave Reisner <dreisner@archlinux.org>
#               Matthias Blaicher <matthias@blaicher.com>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname=capnproto
pkgver=0.5.3
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system"
arch=('i686' 'x86_64')
url='http://kentonv.github.io/capnproto/'
license=('MIT')
conflicts=('capnproto-git')
source=("http://capnproto.org/capnproto-c++-${pkgver}.tar.gz")
md5sums=('d6c91a9129457fe5893302cd92e09324')

build() {
  cd "${srcdir}/capnproto-c++-${pkgver}"
  ./configure --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/capnproto-c++-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/capnproto-c++-${pkgver}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
