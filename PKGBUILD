# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=zelda-roth-se
pkgver=1.2.1
pkgrel=2
epoch=
pkgdesc="Zelda : Return of the Hylian solarus edition."
arch=('any')
url="https://www.solarus-games.org/en/games/the-legend-of-zelda-return-of-the-hylian-se"
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
md5sums=('f697f89e5d52ccfc25a9e70d50edda4c')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

