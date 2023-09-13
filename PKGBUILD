# Maintainer: Muhammad Zaky Ramadhan <mzakyr42@gmail.com>

pkgbase=osfetch-sh-git
pkgname=osfetch-sh-git
_pkgname=osfetch-sh
pkgver=r17.ec5682d
pkgrel=1
pkgdesc="osfetch-sh is a stupid system fetch program written in bash for linux."
arch=('any')
url="https://github.com/mzakyr12/${_pkgname}"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/mzakyr12/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/osfetch-sh-git/LICENSE"
  install -D -m755 osfetch "$pkgdir/usr/bin/$_pkgname"
}
