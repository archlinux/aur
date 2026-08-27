# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="Instagram reels in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/njyeung/reels"
license=('MIT')
depends=()
optdepends=('chromium: browser backend' 'google-chrome: browser backend' 'brave-bin: browser backend' 'kitty: terminal with Kitty graphics protocol' 'wezterm: terminal with Kitty graphics protocol' 'konsole: terminal with Kitty graphics protocol')
provides=('reels')
conflicts=('reels')
source_x86_64=("https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-amd64")
sha256sums_x86_64=('4d54de09419cc6648bcda22944be4ba435ea88721b8ffecdec34be1f74cc4989')
source_aarch64=("https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-arm64")
sha256sums_aarch64=('2caf46798a69afbfa5b320af8727f16a75c13089a22dd98642f3d40a9ea727ec')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
    else
        install -Dm755 "$srcdir/reels-linux-arm64" "$pkgdir/usr/bin/reels"
    fi
}
