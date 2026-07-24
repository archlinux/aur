# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.4.1
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
sha256sums_x86_64=('f632097addec905f6e796f95cbc5bba6814a4f556a4722b8ef72077b71d054de')
source_aarch64=("https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-arm64")
sha256sums_aarch64=('f6bea0c72ea8d28650a4b0b60681ac7a5e13cc49a60080193556aad363ac4716')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
    else
        install -Dm755 "$srcdir/reels-linux-arm64" "$pkgdir/usr/bin/reels"
    fi
}
