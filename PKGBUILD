# Maintainer: Mark Keller <mark at markkeller dot  dev>
_BIN=hooky
pkgname=${_BIN}-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A minimal git pre-commit hook runner"
url="https://github.com/brandonchinn178/hooky"
license=("BSD-3-Clause")
depends=('glibc' 'gmp')
arch=('x86_64' 'aarch64')
provides=("hooky=$pkgver")

source_x86_64=("${_BIN}::https://github.com/brandonchinn178/hooky/releases/download/v${pkgver}/hooky-${pkgver}-linux-x86_64"
               "https://github.com/brandonchinn178/hooky/archive/refs/tags/v${pkgver}.tar.gz")
source_aarch64=("${_BIN}::https://github.com/brandonchinn178/hooky/releases/download/v${pkgver}/hooky-${pkgver}-linux-arm64"
               "https://github.com/brandonchinn178/hooky/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums_x86_64=('ea5bd9b0cea43681b0c464ad54f2407117df51f983b524b78fb54c8c56ff25a5'
                   'f1ab5e9537577206bffc95525775eece0a1b85f710ef1f9159e0ed92ac6d2ccf')
sha256sums_aarch64=('ea5bd9b0cea43681b0c464ad54f2407117df51f983b524b78fb54c8c56ff25a5'
                    'f1ab5e9537577206bffc95525775eece0a1b85f710ef1f9159e0ed92ac6d2ccf')

package() {
  install -Dm755 "${srcdir}/${_BIN}" \
                 "${pkgdir}/usr/bin/${_BIN}"
  
  install -Dm644 "${srcdir}/${_BIN}-${pkgver}/LICENSE.md" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
