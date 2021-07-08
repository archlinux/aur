# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec-bin
pkgver=0.45.2
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=(x86_64)
provides=('tfsec')
conflicts=('tfsec')
url="https://github.com/tfsec/tfsec"
license=('MIT')

source=("tfsec-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/tfsec-linux-amd64"
        "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums=('a816324b47de40d1184d930b98abbb693eb7f492e9142cff5606c3437002cde5'
            'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
