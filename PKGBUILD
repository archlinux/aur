# Maintainer: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide

pkgname=zsxd
pkgver=1.12.0
pkgrel=1
epoch=
pkgdesc="Free and opensource, amateur Zelda game with humoristic characters."
arch=('any')
url="http://www.zelda-solarus.com/"
license=('custom')
groups=()
depends=('solarus>=1.6.0')
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
source=(http://www.zelda-solarus.com/downloads/zsxd/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f2574d6cca5d81c0cdb8559b50ffd524')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/echo 'solarus /echo 'solarus_run /" CMakeLists.txt
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}


