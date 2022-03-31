# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=sambamba
pkgver=0.8.2
pkgrel=2
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
depends=(lz4 liblphobos)
makedepends=(ldc)
source=(https://github.com/biod/sambamba/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=(10f7160db5a1c50296b32e94f7d7570739aa7d90c93fe0981246fe89eab6dd98)

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "bin/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

}
