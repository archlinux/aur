# Maintainer: czyt <czytcn@gmail.com>
pkgname=bast-bin
pkgver=0.9.3
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
sha256sums_x86_64=('143de5d733b034a9660be4f94385de50119d79913e7df3d5541ce1c6542ba667')
sha256sums_aarch64=('8dbe3864aedcbfbaadd6c0bffb6da7073350fa753944aa0665cd80cd7117b4a7')

package() {
    local _bundle
    case "$CARCH" in
        x86_64) _bundle="bast_${pkgver}_linux_amd64" ;;
        aarch64) _bundle="bast_${pkgver}_linux_arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_bundle}/bast" "${pkgdir}/usr/bin/bast"
}
