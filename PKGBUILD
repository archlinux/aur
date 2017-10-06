# Maintainers: to-be-filled
# Contributors: Dave Reisner <dreisner@archlinux.org>
#               Matthias Blaicher <matthias@blaicher.com>
#               Severen Redwood <severen@shrike.me>

pkgname=capnproto
pkgver=0.6.1
pkgrel=3
pkgdesc="Cap'n Proto serialization/RPC system"
arch=('i686' 'x86_64')
url='https://capnproto.org/'
license=('MIT')
replaces=('capnproto-0.6')
provides=('capnproto')
conflicts=('capnproto-git')
source=("https://capnproto.org/capnproto-c++-${pkgver}.tar.gz")
sha512sums=('cd35aec18175b28149cf39ccbf360f8023d2762d04c0d6fdfbd7789ca26eac6228dfec6a414f48ff78aec4aad4c3d9d5f143a6a59dd86c16f653fc538e64b58e')

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
