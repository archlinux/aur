# Maintainer: BenObiWan <benobiwan @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
pkgname=zsdx-git
pkgver=1799.29ffb12
pkgrel=1
epoch=
pkgdesc="A free 2D Zelda fangame."
arch=('any')
url="http://www.zelda-solarus.com/"
license=('custom')
groups=()
depends=('solarus-git')
makedepends=('git' 'cmake' 'zip' )
checkdepends=()
optdepends=()
provides=('zsdx')
conflicts=('zsdx')
backup=()
options=()
install=
changelog=
source=("$pkgname"::'git://github.com/christopho/zsdx.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
