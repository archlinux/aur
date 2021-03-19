# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec
pkgver=0.39.10
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
url="https://github.com/tfsec/tfsec"
license=('MIT')

source=("tfsec-${pkgver}::${url}/releases/download/v${pkgver}/tfsec-linux-amd64"
        "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums=('ca56772425e9c3c5e17107b0e3e50c21df07b17a2c4a6a5af0f4d2e70150ed8d'
            'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
