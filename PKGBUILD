# Contributor: chrcoe
# Maintainer: chrcoe

pkgname=sparkfun-eagle-lib-git
pkgrel=1
pkgver=1148.46eb3c9
pkgdesc="SparkFun Eagle Libraries"
arch=('any')
url="https://github.com/sparkfun/SparkFun-Eagle-Libraries"
license=('CCPL')
depends=('eagle')
makedepends=('git-core')
source=("${pkgname}::git://github.com/sparkfun/SparkFun-Eagle-Libraries.git")
md5sums=('SKIP')

_eagle="/usr/share/eagle"

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package(){
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/${_eagle}/lbr/sparkfun"
  install -Dm644 *.lbr "${pkgdir}/${_eagle}/lbr/sparkfun"
}
