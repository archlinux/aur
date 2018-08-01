# Maintainer: Marcouney <fora at mrdc dot fr>
pkgname=jpegrescan-git
_pkgname=jpegrescan
pkgver=1.1.0.r14.g4a2fc99
pkgrel=1
pkgdesc="Losslessly shrink any JPEG file."
arch=(any)
url="https://github.com/kud/jpegrescan"
license=('GPL')
depends=('perl-file-slurp' 'libjpeg-turbo')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}/"
  mkdir -p "${pkgdir}/usr/bin"
  cp ${_pkgname} "${pkgdir}/usr/bin"
}
