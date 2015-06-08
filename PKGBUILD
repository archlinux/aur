# Contributor: CYB3R <dima@golovin.in>
# Maintainer: pzl

pkgname=sparkfun-kicad-lib-git
pkgrel=1
pkgver=1.5227e19
pkgdesc="SparkFun KiCad library converted from Eagle"
arch=('any')
url="https://www.sparkfun.com/static/eagle/"
license=('CCPL')
depends=('kicad')
makedepends=('git-core')
source=("${pkgname}::git://github.com/cfobel/sparkfun_kicad_lib.git")
md5sums=('SKIP')

_kicad="/usr/share/kicad"

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package(){
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/${_kicad}/library" "${pkgdir}/${_kicad}/modules"
  install -Dm755 SparkFun.lib "${pkgdir}/${_kicad}/library/" 
  install -Dm755 SparkFun.mod "${pkgdir}/${_kicad}/modules/" 
}
