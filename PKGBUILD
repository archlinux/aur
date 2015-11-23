# Maintainer: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# cONTRibutor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide

pkgname=zsdx
pkgver=1.10.2
pkgrel=2
epoch=
pkgdesc="A free 2D Zelda fangame."
arch=('any')
url="http://www.zelda-solarus.com/"
license=('custom')
groups=()
depends=('solarus>=1.2.0')
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
md5sums=('2da8cd5954537978ea23a85b85328b02')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

