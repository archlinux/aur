# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Aaron Griffin <aaron@archlinux.org> 
# Contributor: Elmo Todurov <todurov@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=scanmem
pkgver=0.15.1
pkgrel=1
pkgdesc="Memory scanner designed to isolate the address of an arbitrary variable in an executing process"
url="https://github.com/scanmem/scanmem"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pygtk' 'python-gobject' 'polkit')
makedepends=('intltool')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('a78ea7bc4a0f3ee068a7b9de3efb3a3db734ae2280bd6a270be947cc6a8254ff715e65ff007a8593be04030b9d29d420dd1564fd57349fc61a4f99da004b10e4')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --enable-gui --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
