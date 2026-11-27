# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=ztd
pkgver=0.4.1
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
sha256sums_x86_64=('40a8ef206696110db0016c358decce0c7edede977cb3217a31224e2b446321e5')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd-aarch64-linux")
sha256sums_aarch64=('295bf86f43b21f8eb13cde04cd909893474dde0cb90ab5d1fb98ec1a998daeee')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ztd.1.gz "${pkgdir}/usr/share/man/man1/ztd.1.gz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
