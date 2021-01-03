#Maintainer: Julian Marcos <julian08@cock.li>

pkgname=superbfetch-git
_gitname="bfetch"
pkgver=67330568d1a5ff93c5354567e7e70349df34ed43
pkgrel=1
pkgdesc="Simple Fetch program written in bash"
arch=('any')
url="https://github.com/NNBnh/bfetch"
license=('custom')
makedepends=('git')
provides=("bfetch")
conflicts=("bfetch-git")
source=('git+https://github.com/NNBnh/bfetch')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  mv "bfetch" "${pkgdir}/usr/bin/bfetch"
}
