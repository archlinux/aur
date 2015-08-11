pkgname=sescript-git
_gitname=sescript
pkgver=3d8cd12
pkgrel=1
pkgdesc='a scheme syntax to ecmascript and javascript compiler'
arch=(any)
license=(GPL3)
makedepends=(git gcc)
depends=(guile sph-lib-git)
provides=(sescript)
source=("git://git.sph.mn/$_gitname")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

package() {
  cd $_gitname
  ./exec/install "${pkgdir}"
  chmod 755 -R "${pkgdir}"
}