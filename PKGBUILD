# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=ztd
pkgver=0.3.0
pkgrel=1
pkgdesc="Local task system for humans and agents"
arch=('x86_64' 'aarch64')
url="https://github.com/vmvarela/ztd"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("LICENSE::https://raw.githubusercontent.com/vmvarela/ztd/v${pkgver}/LICENSE"
        "ztd.1.gz::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd.1.gz")
sha256sums=('1c220f59f6056d71b2f088d26b1e706e37a0710d62ad75e24ae796f8e1794a18' 'dfd23999e017988f329a919fa933ac9e89acdf568ea76570b4ec2f0e293fd52e')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd-x86_64-linux")
sha256sums_x86_64=('dd19c31111e9d828344c80b45c88d846ddca194bf858ca77c37b85ab9ffd868e')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd-aarch64-linux")
sha256sums_aarch64=('f1199bc17395d71e09ebc3b749623572d8a38e48ec2f1889a90c1ff40bc9093c')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ztd.1.gz "${pkgdir}/usr/share/man/man1/ztd.1.gz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
