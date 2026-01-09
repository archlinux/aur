# Maintainer: jslay88
pkgname=zladxhd-installer-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Automated installer for Zelda: Link's Awakening DX HD on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/jslay88/zladxhd-installer"
license=('MIT')
depends=('glibc')
optdepends=(
    'steam: Required for Steam integration'
    'protontricks: Required for Wine prefix setup'
    'flatpak: Alternative protontricks installation method'
)
provides=('zladxhd-installer')
conflicts=('zladxhd-installer')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/jslay88/zladxhd-installer/releases/download/v${pkgver}/zladxhd-installer-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/jslay88/zladxhd-installer/releases/download/v${pkgver}/zladxhd-installer-linux-arm64.tar.gz")
sha256sums_x86_64=('e6b65d33abce8d82647a7174960d9ab6b11c01d475aae9cbe1df6d4b1b1c7038')
sha256sums_aarch64=('6d94463510f3b4a93dce2ff6bd754659117a99db2f3b65da0c87ab8f7e1d07d5')

package() {
    cd "$srcdir"
    
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 zladxhd-installer-linux-amd64 "$pkgdir/usr/bin/zladxhd-installer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 zladxhd-installer-linux-arm64 "$pkgdir/usr/bin/zladxhd-installer"
    fi
}
