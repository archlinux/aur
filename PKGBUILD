# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=imgdataopt-git
_pkgname=imgdataopt
pkgver=r73.5906ee3
pkgrel=1
pkgdesc="converts PNG and PNM images with lossless size optimizations"
arch=(x86_64)
url="https://github.com/pts/imgdataopt"
license=('GPL')
depends=('glibc')
makedepends=(
  'make'
  'git'
)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  cp $_pkgname "${pkgdir}/usr/bin/"
}
