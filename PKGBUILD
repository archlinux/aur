pkgname=sph-dg-git
_gitname=sph-dg
pkgver=71b1d03
pkgrel=1
pkgdesc='generic graph database for guile'
arch=(any)
license=(GPL3)
makedepends=(git sph-sc-git)
depends=(guile sph-lib-git liblmdb)
provides=(sph-dg)
source=("git://git.sph.mn/$_gitname")
url="http://sph.mn/content/2faf"
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

package() {
  cd $_gitname
  chmod 755 -R "${pkgdir}"
  ./exec/compile
  ./exec/install "${pkgdir}"
}