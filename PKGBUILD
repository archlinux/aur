pkgname=guile-fuse-git
_gitname=guile-fuse
pkgver=3b3f498
pkgrel=1
pkgdesc='guile bindings for fuse - filesystems in userspace'
arch=(any)
license=(GPL3)
provides=(guile-fuse)
makedepends=(git sph-sc-git)
depends=(guile fuse)
source=("git://sph.mn/guile-fuse")
url="http://sph.mn/content/467"
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

build() {
  cd $_gitname
  ./exec/compile || echo either sph-sc is not installed or guile-reader had a memory error and a you could retry
}

package() {
  cd $_gitname
  ./exec/install $pkgdir
}