_name=guile-fuse
arch=(any)
conflicts=($_name)
depends=("guile>=2" fuse)
license=(gpl3+)
makedepends=(git gcc)
md5sums=(SKIP)
pkgdesc='guile bindings for fuse (filesystems in userspace) as a shared library'
pkgname=$_name-git
pkgrel=1
pkgver=24
provides=($_name)
source=("$_name::git://git.sph.mn/$_name")
url="http://sph.mn"

pkgver() {
  cd $_name
  git rev-list --count HEAD
}

build() {
  cd $_name
  ./exe/compile-c
}

package() {
  cd $_name
  ./exe/install "$pkgdir"
}