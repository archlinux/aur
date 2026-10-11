# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.4.9
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
sha256sums_x86_64=('5e6c7a7b1fe7842231edee7d2b7d56d3a205ba368d2c19111d338e01293be3a1')
source_aarch64=("reels-${pkgver}-linux-arm64::https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-arm64")
sha256sums_aarch64=('0d760611443372c0dd90b73267b3027f5d1a24a9747263a42bf4ffab577938fa')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/reels-${pkgver}-linux-amd64" "$pkgdir/usr/bin/reels"
    else
        install -Dm755 "$srcdir/reels-${pkgver}-linux-arm64" "$pkgdir/usr/bin/reels"
    fi
}
