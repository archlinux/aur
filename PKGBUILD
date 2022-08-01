# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec-bin
pkgver=1.27.1
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=('aarch64' 'x86_64')
provides=('tfsec')
conflicts=('tfsec')
url="https://github.com/aquasecurity/tfsec"
license=('MIT')

source_aarch64=("tfsec-${pkgver}-${pkgrel}_aarch64::${url}/releases/download/v${pkgver}/tfsec-linux-arm64"
                "tfsec-${pkgver}-${pkgrel}_aarch64.asc::${url}/releases/download/v${pkgver}/tfsec-linux-arm64.D66B222A3EA4C25D5D1A097FC34ACEFB46EC39CE.sig"
                "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")
source_x86_64=("tfsec-${pkgver}-${pkgrel}_x86_64::${url}/releases/download/v${pkgver}/tfsec-linux-amd64"
               "tfsec-${pkgver}-${pkgrel}_x86_64.asc::${url}/releases/download/v${pkgver}/tfsec-linux-amd64.D66B222A3EA4C25D5D1A097FC34ACEFB46EC39CE.sig"
               "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums_aarch64=('d6a13665dd0ebb1f1c2339d4c0779904f8c3b801794461cb6079842565de24ae'
                    'SKIP'
                    'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')
sha256sums_x86_64=('edf06ce4897a3113dda6393b31345aea8b70626dac4c67df87ef0b69fd6c83f0'
                   'SKIP'
                   'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

validpgpkeys=('D66B222A3EA4C25D5D1A097FC34ACEFB46EC39CE')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}-${pkgrel}_${CARCH}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
