# Maintainer: Daniele Olivieri <danieledaniele1988 at gmail dot com>

pkgname=yalmip-git
pkgver=R20230622
pkgrel=2
pkgdesc="MATLAB toolbox for optimization modeling"
arch=('x86_64')
url="https://yalmip.github.io/"
license=('custom')
#depends=()
optdepends=(
  'matlab: MATLAB programming interface support, versions 2008b onwards'
)
source=(
  "https://github.com/yalmip/YALMIP/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=(
  '9dfb3725314fd5d6fa1c92cd92d35df7'
)

prepare(){
  cd "${srcdir}/YALMIP-${pkgver}/"
  rm -R ".github"
  rm -R ".gitignore"
}

package() {

  cd "${srcdir}/YALMIP-${pkgver}/"

  # License
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  rm license.txt
  
  # Library files
  mkdir -p "${pkgdir}/usr/lib/YALMIP"
  cp -a * "${pkgdir}/usr/lib/YALMIP"
}

install=.install
