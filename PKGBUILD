# Maintainer: Ignacio Medina <ignacionmedina1@gmail.com>
pkgname=routeros-cli-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI tool for managing MikroTik RouterOS routers (binary name: ros)"
arch=('x86_64' 'aarch64')
url="https://github.com/nic0der-im/routeros-cli"
license=('MIT')
provides=('routeros-cli' 'ros')
conflicts=('routeros-cli' 'ros')

# Publish this PKGBUILD in a separate AUR git repo (not this tree).

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nic0der-im/routeros-cli/releases/download/v${pkgver}/ros_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nic0der-im/routeros-cli/releases/download/v${pkgver}/ros_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('9bc7be59b01196c5ee377ed6ef144c6465efe4cead708f48c7e3f6ca2c9a571a')
sha256sums_aarch64=('d262b6ad1a6e8313502f4118036b46e0b15c98d67f83ed2ffe0b8a2c45347924')

package() {
    install -Dm755 ros "${pkgdir}/usr/bin/ros"
    ln -s ros "${pkgdir}/usr/bin/routeros-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
