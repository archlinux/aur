# Maintainer: BenObiWan <benobiwan @t gmail dot com>

pkgname=zelda-roth-se
pkgver=1.0.7
pkgrel=2
epoch=
pkgdesc="Zelda : Return of the Hylian solarus edition."
arch=('any')
url="http://www.zelda-solarus.com/"
license=('custom')
groups=()
depends=('solarus>=1.4.0')
makedepends=('zip' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.zelda-solarus.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('5d2b9084da435c4efe673cafa8aa4f64')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

