# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide

pkgname=zsdx
pkgver=1.12.3
pkgrel=1
epoch=
pkgdesc="The Legend of Zelda: Mystery of Solarus DX - A free 2D Zelda fangame"
arch=('any')
url="https://www.solarus-games.org/fr/games/the-legend-of-zelda-mystery-of-solarus-dx"
license=('custom')
groups=()
depends=('solarus>=1.6.0')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/solarus-games/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
noextract=()
md5sums=('fb6de53da0a3088a6692c7dfafb580f1')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

