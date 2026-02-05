# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname="pkg2appimage"
pkgdesc="Tool and recipes to convert existing deb packages to AppImage. (Upstream CI)"
_pkgver=$(wget -q https://api.github.com/repos/AppImageCommunity/pkg2appimage/releases -O - | grep -iP '(?<=pkg2appimage-).*(?=-x86_64.AppImage)' -o | head -n 1)
pkgver=${_pkgver}
pkgrel=1
url="https://github.com/AppImageCommunity/pkg2appimage"
license=("GPL-2.0-only")
arch=("any")
provides=("$pkgname=$pkgver")
makedepends=(
    'wget'
    'grep'
)
pkg2appimage_url=$(wget -q https://api.github.com/repos/AppImageCommunity/pkg2appimage/releases -O - | grep 'pkg2appimage-.*-x86_64.AppImage' | grep browser_download_url | head -n 1 | cut -d '"' -f 4)
source=("$pkgname::$pkg2appimage_url")
noextract=("$pkgname.AppImage")

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.AppImage $pkgdir/usr/share
}
b2sums=('891699f8362e463008f25c9b2211acffd301487bad62657cdc9dca9c26521a188682736f23f596391f6d29e40150cfa0cfdd6112d39b2775e00848cbcd240d41')
sha512sums=('7e7954963b0d679cf550757cbb639be5f33dcc951b9894a5bec494e9cc49ad67a93c1b00350d04d191916860b442e6b307eb848a303fde20fb34254d164f092a')
sha384sums=('dc352cec7db6848126f7bebced61ee72a3f1b855ecff89b68a30613aafab3542027e173028a6a08dc8938cc0a5dce2f1')
sha256sums=('6f74ec26ba14d2d8f1857d150704f9d585dae30b1ca30ce46f375c157b71d07d')
