# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=20260613
pkgrel=1
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-ttf'
license=('custom')
provides=(emoji-font)
install="${pkgname}.install"
source=(
    "AppleColorEmoji-$pkgver.ttf::https://github.com/samuelngs/apple-emoji-ttf/releases/download/macos-26-20260613-f1fc560b/AppleColorEmoji-Linux.ttf"
    "75-apple-color-emoji.conf"
)
sha512sums=(
    'acada8b06c3f41775585de8a829eb345c3ff44ca1cb6a2908a5699941aff1369761642063a786e026cf332ef2662cd5fa13348cdcb62a88795b637468ababf9e'
    'aa7d5960e811cf2d3c61e497372fad4b4bb5e31f31d23b5c0dfd261c4e470279e96d957c38b8da844e1a1a3fbe992f58b74753601bd56bcec815ac308deb5995'
)
package() {
    install -Dm644 "$srcdir/AppleColorEmoji-$pkgver.ttf" \
      "${pkgdir}/usr/share/fonts/apple-color-emoji/apple-color-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-apple-color-emoji.conf"
}

