# Maintainer: czyt <czytcn@gmail.com>
pkgname=bast-bin
pkgver=0.9.1
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
sha256sums_x86_64=('3ff82714679eaab0705b0a86ddd3e04cea80f39c2170618f954297f4bcdd6fbe')
sha256sums_aarch64=('59f6f6b61d9e9041c81edfcef5f02c3b669407e58cff01b305ac9ca580863000')

package() {
    local _bundle
    case "$CARCH" in
        x86_64) _bundle="bast_${pkgver}_linux_amd64" ;;
        aarch64) _bundle="bast_${pkgver}_linux_arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_bundle}/bast" "${pkgdir}/usr/bin/bast"
}
