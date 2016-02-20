pkgname=sph-lib-git
_gitname=sph-lib
pkgver=a641d33
pkgrel=3
pkgdesc='set of over 80 guile scheme libraries'
arch=(any)
license=(gpl3)
makedepends=(git)
depends=(guile)
provides=(sph-lib)
source=("git://git.sph.mn/sph-lib")
url="http://sph.mn/content/187"
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

package() {
  cd $_gitname
  chmod 755 -R "${pkgdir}"
  ./exe/install "${pkgdir}"
}