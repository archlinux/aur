# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec-bin
pkgver=1.25.1
pkgrel=2
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

sha256sums_aarch64=('6cacffeb4f216229a38eb3fd3b8f83a4f45174d5671cc6a35c99d9607601931a'
                    'SKIP'
                    'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')
sha256sums_x86_64=('f690ae540685d81dbc1c8b28766c7175c3469398b68a8b50d5a03be6190d951b'
                   'SKIP'
                   'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

validpgpkeys=('D66B222A3EA4C25D5D1A097FC34ACEFB46EC39CE')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}-${pkgrel}_${CARCH}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
