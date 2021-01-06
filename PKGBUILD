# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=avs2yuv-git
pkgver=r20.7aa19f9
pkgrel=1
pkgdesc="A simple tool that can execute avisynth scripts. (GIT version)"
arch=('x86_64')
url='https://github.com/DJATOM/avs2yuv'
license=('LGPL')
depends=('avisynthplus')
makedepends=('git')
provides=('avs2yuv')
conflicts=('av2yuv')
source=('git+https://github.com/DJATOM/avs2yuv.git')
sha256sums=('SKIP')

pkgver() {
  cd avs2yuv
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#   echo "$(git describe --long --tags | tr - .)"
}

build() {
  make -C avs2yuv
}

package(){
  install -d "${pkgdir}/usr/bin"
  make -C avs2yuv PREFIX="${pkgdir}/usr" install
}
