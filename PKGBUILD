# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO: manpages?

pkgname='libcs50'
pkgver=8.0.4
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
  '034725f1bcac5f224dfabe5ccbb98a6c4ccf94baaf848223b465b5dd092a3703'
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
