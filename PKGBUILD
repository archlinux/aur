# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=20260219
pkgrel=1
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-ttf'
license=('custom')
provides=(emoji-font)
install="${pkgname}.install"
source=(
    "AppleColorEmoji-$pkgver.ttf::https://github.com/samuelngs/apple-emoji-ttf/releases/download/macos-26-20260219-2aa12422/AppleColorEmoji-Linux.ttf"
    "75-apple-color-emoji.conf"
)
sha512sums=(
    '271acbaa8acb1bbbd202f08f1cba4e6b8ebdd7b194c9da45b2142c96e83ef5064ab7d3159c1f3d8904397e803190074060c572770f713c402e886ae874abc86f'
    'aa7d5960e811cf2d3c61e497372fad4b4bb5e31f31d23b5c0dfd261c4e470279e96d957c38b8da844e1a1a3fbe992f58b74753601bd56bcec815ac308deb5995'
)
package() {
    install -Dm644 "$srcdir/AppleColorEmoji-$pkgver.ttf" \
      "${pkgdir}/usr/share/fonts/apple-color-emoji/apple-color-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-apple-color-emoji.conf"
}

