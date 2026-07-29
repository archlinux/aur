# Maintainer: Ignacio Medina <ignacionmedina1@gmail.com>
pkgname=routeros-cli-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="CLI tool for managing MikroTik RouterOS routers (binary name: ros)"
arch=('x86_64' 'aarch64')
url="https://github.com/nic0der-im/routeros-cli"
license=('MIT')
provides=('routeros-cli' 'ros')
conflicts=('routeros-cli' 'ros')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nic0der-im/routeros-cli/releases/download/v${pkgver}/ros_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nic0der-im/routeros-cli/releases/download/v${pkgver}/ros_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('6030dc7621d9f615dd8f635e4a51804a1c3e8842582af58e95f0ea9bdd8ce7c4')
sha256sums_aarch64=('cca0283de2fd078d95529109ac66bcc30c1f08c244419b6bb1e882bfb55b80a4')

package() {
    install -Dm755 ros "${pkgdir}/usr/bin/ros"
    ln -s ros "${pkgdir}/usr/bin/routeros-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
