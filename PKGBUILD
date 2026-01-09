# Maintainer: jslay88
pkgname=zladxhd-installer-bin
pkgver=0.1.0
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
sha256sums_x86_64=('eea77000274d337e4ff0016160040564b60c435ad38f36dab5bfc074dfce9196')
sha256sums_aarch64=('d7f2172f381f1b39ecaee5452f2cae56fe34bc95199422e68abf7915764b3cd1')

package() {
    cd "$srcdir"
    
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 zladxhd-installer-linux-amd64 "$pkgdir/usr/bin/zladxhd-installer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 zladxhd-installer-linux-arm64 "$pkgdir/usr/bin/zladxhd-installer"
    fi
}
