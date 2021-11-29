# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec-bin
pkgver=0.61.2
pkgrel=2
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
provides=('tfsec')
conflicts=('tfsec')
url="https://github.com/aquasecurity/tfsec"
license=('MIT')

source=("tfsec-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/tfsec-linux-amd64"
        "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums=('590132a35f4e9ea4398f82610597e9ae48f2e429562ed2b94978860c7da9fbb8'
            'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
