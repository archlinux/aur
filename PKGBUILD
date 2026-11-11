# Maintainer: czyt <czytcn@gmail.com>
pkgname=bast-bin
pkgver=0.12.0
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
sha256sums_x86_64=('debf92da5a74af8b1c8f47a9b970fd7e7c8bffd1ba33a42dbed2d16c33b00838')
sha256sums_aarch64=('8beb8c05ab1e95bad58812381e8d68e989d9637cca31d3d991774e6d3a4cae1d')

package() {
    local _bundle
    case "$CARCH" in
        x86_64) _bundle="bast_${pkgver}_linux_amd64" ;;
        aarch64) _bundle="bast_${pkgver}_linux_arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_bundle}/bast" "${pkgdir}/usr/bin/bast"
}
