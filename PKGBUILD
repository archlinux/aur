# Maintainer: Grigorii Horos <horosgrisa@gmail.com>
_git=5accd55fa90d1a93a62f427c5b34027c1eb0630d
pkgname=timg
pkgver=0.9.1beta
pkgrel=1
pkgdesc="Terminal Image Viewer"
arch=('i686' 'x86_64')
url="https://github.com/hzeller/timg"
license=('GPL2')
groups=()
depends=('graphicsmagick')
makedepends=('make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changelog=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
noextract=()
sha256sums=('3c97a34a205450697d1b3f0c409d76fda02f22a1f3d32a301c5448aa033bb41f')

build() {
  cd ${srcdir}/${pkgname}-${_git}/src
  make
}

package() {
  cd ${srcdir}/${pkgname}-${_git}/src
  install -d "${pkgdir}/usr/bin"
  make PREFIX="${pkgdir}/usr" install
}
