# Maintainer: Mark Keller <mark at markkeller dot  dev>
_BIN=hooky
pkgname=${_BIN}-bin
pkgver=1.0.0
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

sha256sums_x86_64=('f6c6500e24e3c1e8f0a67e3b23963661b10c966e5c5eda6634eb35be00f42f05'
                   '4cc8c00203d10aad470bb071a6a00d18e3a55b314f675ed19b824acd87567b1c')
sha256sums_aarch64=('f6c6500e24e3c1e8f0a67e3b23963661b10c966e5c5eda6634eb35be00f42f05'
                    '4cc8c00203d10aad470bb071a6a00d18e3a55b314f675ed19b824acd87567b1c')

package() {
  install -Dm755 "${srcdir}/${_BIN}" \
                 "${pkgdir}/usr/bin/${_BIN}"
  
  install -Dm644 "${srcdir}/${_BIN}-${pkgver}/LICENSE.md" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
