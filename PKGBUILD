# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=16.4
pkgrel=5
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-linux'
license=('custom')
provides=(emoji-font)
depends=()
conflicts=(
    'noto-fonts-emoji'
    'ttf-symbola'
    'ttf-joypixels'
    'ttf-twemoji-color'
    'ttf-whatsapp-emoji'
)
source=(
    "AppleColorEmoji.ttf::$url/releases/download/v16.4-patch.1/AppleColorEmoji.ttf"
    "75-apple-color-emoji.conf"
)
sha512sums=(
    "c91dac619e71832fd5fa36550c94f0cda8fb4554b449e3c30db617654e9680f7c350c1ee76d5d774bab4279478e1d4fa92930e68eebb4ed5455169538301ec98"
    "aa7d5960e811cf2d3c61e497372fad4b4bb5e31f31d23b5c0dfd261c4e470279e96d957c38b8da844e1a1a3fbe992f58b74753601bd56bcec815ac308deb5995"
)
package() {
    install -Dm644 "$srcdir/AppleColorEmoji.ttf" \
      "${pkgdir}/usr/share/fonts/apple-color-emoji/apple-color-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-apple-color-emoji.conf"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/75-apple-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

