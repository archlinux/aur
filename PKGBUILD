# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Dave Reisner <dreisner@archlinux.org>
#               Matthias Blaicher <matthias@blaicher.com>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname=capnproto-0.6
pkgver=0.6.1
pkgrel=2
pkgdesc="Cap'n Proto serialization/RPC system"
arch=('i686' 'x86_64')
url='http://kentonv.github.io/capnproto/'
license=('MIT')
provides=('capnproto')
conflicts=('capnproto-git')
source=("http://capnproto.org/capnproto-c++-${pkgver}.tar.gz")
md5sums=('d48846a72abe327b44e258bd46294d1e')

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
