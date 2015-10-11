# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif-git
_pkgname=FLIF
pkgver=r113.7bbc998
pkgrel=1
pkgdesc="Free Lossless Image Format"
arch=("i686" "x86_64")
url="https://github.com/FLIF-hub/FLIF"
license=('GPL3')
conflicts=('flif')
depends=('zlib' 'libpng')
makedepends=('git')
source=('git+https://github.com/FLIF-hub/FLIF.git')
sha256sums=('SKIP')


pkgver() {
      cd "$srcdir/${_pkgname}"
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m755 flif "${pkgdir}/usr/bin" 
}
