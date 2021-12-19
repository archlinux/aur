# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>
# Contributor: Qontinuum <qontinuum dot dev @t protonmail dot ch>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide

pkgname=zsxd
pkgver=1.12.2
pkgrel=4
epoch=
pkgdesc="Zelda: Mystery of Solarus XD - an open-source parodic fangame"
arch=('any')
url="https://www.solarus-games.org/en/games/the-legend-of-zelda-mystery-of-solarus-xd"
license=('GPL3' 'custom')
groups=()
depends=('solarus>=1.6.0')
makedepends=('cmake' 'zip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog="${pkgname}.changelog.md"
source=("https://gitlab.com/solarus-games/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
noextract=()
validpgpkeys=()
b2sums=('1cba628a427cae10e0b08498690b95ef5a60f62531b1b4c7635ccbd561201ff54511b5c32e8e5e3251625e08276466ef2faa81f62eb2b67669cc001b00b7f215')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
