# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=ztd
pkgver=0.4.2
pkgrel=1
pkgdesc="Local task system for humans and agents"
arch=('x86_64' 'aarch64')
url="https://github.com/vmvarela/ztd"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("LICENSE::https://raw.githubusercontent.com/vmvarela/ztd/v${pkgver}/LICENSE"
        "ztd.1.gz::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd.1.gz")
sha256sums=('1c220f59f6056d71b2f088d26b1e706e37a0710d62ad75e24ae796f8e1794a18' 'c1897533e73470bcd22d50140945bddbe2f6efba53500d950dea598a72ac8704')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd-x86_64-linux")
sha256sums_x86_64=('7eeddc8a5383ebfecc5ff7cada198d5248833ac23330789ee0bd29da6f9c17df')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/ztd/releases/download/v${pkgver}/ztd-aarch64-linux")
sha256sums_aarch64=('4d3783500090a5dba5f5626f2f29d47d41bba4b00f0fca44ad97ec871e99e283')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ztd.1.gz "${pkgdir}/usr/share/man/man1/ztd.1.gz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
