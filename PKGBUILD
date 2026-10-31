# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.4.10
pkgrel=1
pkgdesc="Instagram reels in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/njyeung/reels"
license=('MIT')
depends=()
optdepends=('chromium: browser backend' 'google-chrome: browser backend' 'brave-bin: browser backend' 'kitty: terminal with Kitty graphics protocol' 'wezterm: terminal with Kitty graphics protocol' 'konsole: terminal with Kitty graphics protocol')
provides=('reels')
conflicts=('reels')
source_x86_64=("reels-${pkgver}-linux-amd64::https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-amd64")
sha256sums_x86_64=('3b46b412dd4fdaa3d9e6faa91b125e9127aaec00a4fde65eb5931aeb76355d21')
source_aarch64=("reels-${pkgver}-linux-arm64::https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-arm64")
sha256sums_aarch64=('fcea1d1db450fe09cf039365838fa79484bb9732537e2017c2944677d2daae5f')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/reels-${pkgver}-linux-amd64" "$pkgdir/usr/bin/reels"
    else
        install -Dm755 "$srcdir/reels-${pkgver}-linux-arm64" "$pkgdir/usr/bin/reels"
    fi
}
