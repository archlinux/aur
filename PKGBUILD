# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.4.0
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
sha256sums_x86_64=('63d1d05e92d882001dffe125d3af816c7b1c0f07ba8d5287f9ea68d6de652a89')
source_aarch64=("https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-arm64")
sha256sums_aarch64=('9ee8f6824dba26db156b1fa724cc74d950371114c2f2f13da1aa90fb038d74bd')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
    else
        install -Dm755 "$srcdir/reels-linux-arm64" "$pkgdir/usr/bin/reels"
    fi
}
