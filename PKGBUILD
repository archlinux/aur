# Maintainer: czyt <czytcn@gmail.com>
pkgname=bast-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="A terminal UI and CLI for browsing SSH hosts, managing keys, and connecting to servers"
arch=('x86_64' 'aarch64')
url="https://bast.sh"
license=('MIT')
options=('!debug')
depends=('openssh')
optdepends=('aws-cli-v2: AWS cloud instance synchronization')
provides=('bast')
conflicts=('bast')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ellipse-software/bast/releases/download/v${pkgver}/bast_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/ellipse-software/bast/releases/download/v${pkgver}/bast_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('788f1d7dc3ccb4038fd4e6ca3335b4166a4daa015c04093388f4cc5c08cfc894')
sha256sums_aarch64=('26d819334bf63786d5b6241d749f3a85fc9424b2bffb706e030d1dbd6194a0ca')

package() {
    local _bundle
    case "$CARCH" in
        x86_64) _bundle="bast_${pkgver}_linux_amd64" ;;
        aarch64) _bundle="bast_${pkgver}_linux_arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_bundle}/bast" "${pkgdir}/usr/bin/bast"
}
