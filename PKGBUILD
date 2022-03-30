# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec-bin
pkgver=1.15.2
pkgrel=2
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=('aarch64' 'x86_64')
provides=('tfsec')
conflicts=('tfsec')
url="https://github.com/aquasecurity/tfsec"
license=('MIT')

source_aarch64=("tfsec-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/tfsec-linux-arm64"
                "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")
source_x86_64=("tfsec-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/tfsec-linux-amd64"
               "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums_aarch64=('1a558ede01fd138f4a8823288552a5fe36b5de91a0793bac3fa068621cc2c8be'
                    'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')
sha256sums_x86_64=('1a558ede01fd138f4a8823288552a5fe36b5de91a0793bac3fa068621cc2c8be'
                   'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
