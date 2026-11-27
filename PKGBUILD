# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=ztd
pkgver=0.4.0
pkgrel=1
pkgdesc="Local task system for humans and agents"
arch=('x86_64' 'aarch64')
url="https://github.com/vmvarela/ztd"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("LICENSE::https://raw.githubusercontent.com/vmvarela/ztd/v${pkgver}/LICENSE"
        "ztd.1.gz::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd.1.gz")
sha256sums=('1c220f59f6056d71b2f088d26b1e706e37a0710d62ad75e24ae796f8e1794a18' 'f84d914bbb9c67b78505bc269fd52028557f04336dba190f9d4e48030e6b1b95')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd-x86_64-linux")
sha256sums_x86_64=('8fe024547b1f46b410d136444f15d55a6e40e2a148e791ac831e28b65508466e')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd-aarch64-linux")
sha256sums_aarch64=('6e04d659941f886db45ef9e57d88f3059225e2d593e1e6d65154934685f83393')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ztd.1.gz "${pkgdir}/usr/share/man/man1/ztd.1.gz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
