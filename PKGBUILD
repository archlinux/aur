# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=biobambam
pkgver=2.0.79
pkgrel=1
release=20171006114010
pkgdesc="Bioinformatics BAM file pre-processing utilities"
arch=('x86_64')
url="https://github.com/gt1/biobambam2"
license=('GPL3')
depends=('libmaus>=2.0')
makedepends=('gcc-libs')
provides=('biobambam')
conflicts=('biobambam')
source=("https://github.com/gt1/${pkgname}2/archive/${pkgver}-release-${release}.tar.gz")
md5sums=('534458a7b22e37bfd4b5b6e9c590553f')
MAKEFLAGS="-j$(nproc)"

build()
{
  cd "${srcdir}/${pkgname}2-${pkgver}-release-${release}"
  ./configure \
    --prefix="${pkgdir}/usr"
}

check() {
  cd "${srcdir}/${pkgname}2-${pkgver}-release-${release}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}2-${pkgver}-release-${release}"
  make install
}
