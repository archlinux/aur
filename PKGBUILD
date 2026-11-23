# Maintainer: czyt <czytcn@gmail.com>
pkgname=bast-bin
pkgver=0.12.1
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
sha256sums_x86_64=('a134b9b0016b8ea41300e6af5b75ce5eec4b6e020b42ce87dd62901776bbecac')
sha256sums_aarch64=('16e810253d2059bc58757e9fce78be8864b3f6f5436880ba1113d018f24b94e2')

package() {
    local _bundle
    case "$CARCH" in
        x86_64) _bundle="bast_${pkgver}_linux_amd64" ;;
        aarch64) _bundle="bast_${pkgver}_linux_arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_bundle}/bast" "${pkgdir}/usr/bin/bast"
}
