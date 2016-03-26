arch=(any)
conflicts=(guile-fuse)
depends=("guile>=2" fuse)
license=(gpl3+)
makedepends=(git gcc sph-sc)
md5sums=(SKIP)
pkgdesc='guile bindings for fuse (filesystems in userspace) as a shared library'
pkgname=guile-fuse-git
pkgrel=1
pkgver=16
provides=(guile-fuse)
source=("$pkgname::git://git.sph.mn/guile-fuse")
url="http://sph.mn/content/467"

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

build() {
  cd $pkgname
  ./exe/compile || echo either sph-sc is not installed or guile-reader had a memory error and you could retry
}

package() {
  cd $pkgname
  ./exe/install --prefix=${pkgdir}
}