# Maintainer: jslay88 <jslay@jslay.net>
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
sha256sums_x86_64=('192de41c42d1f48a186e2fe3ca2e3cd64bf20356f7c92a31a52157e1de295711')
sha256sums_aarch64=('fc498706dd2678d1193c4f45f3a7cc5566451df8b1614bef59aae6ae7abbbacb')

package() {
    cd "$srcdir"
    
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 zladxhd-installer-linux-amd64 "$pkgdir/usr/bin/zladxhd-installer"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 zladxhd-installer-linux-arm64 "$pkgdir/usr/bin/zladxhd-installer"
    fi
}
