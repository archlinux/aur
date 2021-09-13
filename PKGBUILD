# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec-bin
pkgver=0.58.9
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
provides=('tfsec')
conflicts=('tfsec')
url="https://github.com/aquasecurity/tfsec"
license=('MIT')

source=("tfsec-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/tfsec-linux-amd64"
        "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums=('1e1902a67149e15f7ee52c3b4335b75a24623ec2f18faed1ae25cb368d5fadde'
            'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
