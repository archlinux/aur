# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=20260722
pkgrel=1
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-ttf'
license=('custom')
provides=(emoji-font)
install="${pkgname}.install"
source=(
    "AppleColorEmoji-$pkgver.ttf::https://github.com/samuelngs/apple-emoji-ttf/releases/download/macos-26-20260722-484daf4e/AppleColorEmoji-Linux.ttf"
    "75-apple-color-emoji.conf"
)
sha512sums=(
    'df72683963d686ebf33a38cb03b17d22d3460e1c8137d3f3d272a145544306d9d93baaaba80a20fbdff96c0d0037e0b875ea86bef471871dc35ac1c47f2b0807'
    'aa7d5960e811cf2d3c61e497372fad4b4bb5e31f31d23b5c0dfd261c4e470279e96d957c38b8da844e1a1a3fbe992f58b74753601bd56bcec815ac308deb5995'
)
package() {
    install -Dm644 "$srcdir/AppleColorEmoji-$pkgver.ttf" \
      "${pkgdir}/usr/share/fonts/apple-color-emoji/apple-color-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-apple-color-emoji.conf"
}

