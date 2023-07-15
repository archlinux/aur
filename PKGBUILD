_pkgname=vpk-fuse
pkgname=$_pkgname-git
_binname=vpk_fuse
pkgver=r12.4e7e4b7
pkgrel=1
pkgdesc="FUSE filesystem to read Valve VPK files."
arch=("x86_64")
url="https://github.com/ElementW/$_binname"
depends=("fuse")
source=("git+$url.git")
sha256sums=('SKIP')
license=("GPL3")
provides=( "$_pkgname" )
conflicts=( "$_pkgname" )
makedepends=("git")

pkgver() {
  cd "$_binname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_binname"
  make
}

package() {
  install -m 755 -D "$srcdir/$_binname/$_binname" "$pkgdir/usr/bin/$_binname"
}
