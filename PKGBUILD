# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname=tfsec-bin
pkgver=1.24.0
pkgrel=1
pkgdesc="Static analysis powered security scanner for your terraform code"
depends=(glibc)
arch=('aarch64' 'x86_64')
provides=('tfsec')
conflicts=('tfsec')
url="https://github.com/aquasecurity/tfsec"
license=('MIT')

source_aarch64=("tfsec-${pkgver}-${pkgrel}_aarch64::${url}/releases/download/v${pkgver}/tfsec-linux-arm64"
                "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")
source_x86_64=("tfsec-${pkgver}-${pkgrel}_x86_64::${url}/releases/download/v${pkgver}/tfsec-linux-amd64"
               "https://raw.githubusercontent.com/tfsec/tfsec/v${pkgver}/LICENSE")

sha256sums_aarch64=('5b37e9b6b65ad609396f5fe7adba5bfece2dbc5a1c1451f92437ed51fbb02d3a'
                    'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')
sha256sums_x86_64=('acb4fa65e22e0100358fa4cd3d8d851924fd6c171e979fd0c2b818ffaf268cf5'
                   'd59c7e06f84530a8464a352e7b7e153830d566e06aa8ca6a72defa809fad3a37')

package() {
    install -D -m755 "${srcdir}/tfsec-${pkgver}-${pkgrel}_${CARCH}" "${pkgdir}/usr/bin/tfsec"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
