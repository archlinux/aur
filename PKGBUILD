# Contributor: CYB3R <dima@golovin.in>
# Maintainer: pzl

pkgname=sparkfun-kicad-lib-git
pkgrel=1
pkgver=3.99be13c
pkgdesc="SparkFun KiCad library converted from Eagle"
arch=('any')
url="https://www.sparkfun.com/static/eagle/"
license=('CCPL')
depends=('kicad')
makedepends=('git')
source=("${pkgname}::git://github.com/benwis/SparkFun-Kicad-Libraries.git")
md5sums=('SKIP')

_kicad="/usr/share/kicad"

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package(){
  install -dm755 "${pkgdir}${_kicad}/library"
  install -dm755 "${pkgdir}${_kicad}/modules"
  install -dm755 "${pkgdir}${_kicad}/footprints"
  cd "${srcdir}/${pkgname}"
  cp *.lib "${pkgdir}${_kicad}/library/" 
  cp *.dcm "${pkgdir}${_kicad}/library/" 
  cp -r *.pretty "${pkgdir}${_kicad}/footprints/" 
}
