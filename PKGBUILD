# Maintainer: Artem Shustrov <shustrov_a@inbox.ru>
pkgname=evo-cli-bin
pkgver=1.7.2
pkgrel=1
pkgdesc='CLI and MCP server for Cloud.ru Evolution'
arch=('x86_64' 'aarch64')
url='https://github.com/shatim-ops/evo-cli'
license=('Apache-2.0')
provides=('evo-cli' 'cloudru-vm')
conflicts=('evo-cli' 'cloudru-vm')
optdepends=('kubectl: Kubernetes commands' 'helm: Helm commands')

source_x86_64=("${url}/releases/download/v${pkgver}/evo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/evo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('57f1bba1a849f706454322ec570e33c17768d57ec2d30ff18a7b5628895fdb0c')
sha256sums_aarch64=('d5af8f53256c1436bdb4d1ca4c3589d67c3c38c6974381ad4cd764e3294a046b')

package() {
    install -Dm755 "${srcdir}/evo" "${pkgdir}/usr/bin/evo"
    install -Dm755 "${srcdir}/cloudru-vm" "${pkgdir}/usr/bin/cloudru-vm"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -d "${pkgdir}/usr/share/doc/${pkgname}/docs"
    install -m644 "${srcdir}"/docs/*.md "${pkgdir}/usr/share/doc/${pkgname}/docs/"
}
