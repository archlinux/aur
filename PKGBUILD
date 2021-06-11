#Maintainer: Julian Marcos <julian08@cock.li>

pkgname=superbfetch-git
_gitname="bfetch"
pkgver=r85.91c138e
pkgrel=1
pkgdesc="Dynamic fetch displayer that SuperB"
arch=('any')
url="https://github.com/NNBnh/bfetch"
license=('custom')
makedepends=('git')
provides=("bfetch")
conflicts=("bfetch-git")
source=('git+https://github.com/NNBnh/bfetch')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_gitname
}

build() {
  cd $_gitname
}

package() {
  cd $_gitname
  mkdir -p "${pkgdir}/usr/bin"
  mv "bin/bfetch" "${pkgdir}/usr/bin/bfetch"
}
