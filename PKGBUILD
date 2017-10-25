# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=viruskiller
pkgver=1.03
pkgrel=3
pkgdesc="An arcade shoot 'em up game about virus invasion"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?Virus%20Killer"
license=('GPL')
depends=('gcc-libs' 'hicolor-icon-theme' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf')
install="${pkgname}.install"
source=("http://ftp.frugalware.org/pub/archive/frugalware-1.9/source/games-extra/viruskiller/viruskiller-1.03-1.tar.gz"
        "${pkgname}.patch")
md5sums=('ac74f8a49d249a87e3e77cadd9aa6fa9'
         '634374b2c8d57360126b22fc33dfe217')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
