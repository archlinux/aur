# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO: manpages?

pkgname='libcs50'
pkgver=8.0.5
pkgrel=1
pkgdesc="Harvard's cs50 C library"
arch=('i686' 'x86_64')
url='https://cs50.harvard.edu/'
license=('unknown')
groups=('cs50')
conflicts=('libcs50')
provides=('libcs50')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/cs50/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '26a9feddc489285cb858328bc012c7aca1ffcab3b8410727b23e8c43a585fd04'
)

build() {
  cd "${pkgname}-${pkgver}"

  make build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/"
  cp -rp build/* "${pkgdir}/usr/"
}

# vim: ts=2 sw=2 et:
