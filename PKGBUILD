# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=17.4
pkgrel=1
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
    "AppleColorEmoji.ttf::$url/releases/download/v17.4/AppleColorEmoji.ttf"
    "75-apple-color-emoji.conf"
)
sha512sums=(
    "8b3b9580c47689c9762cc666d09bec276d3cb705cd181e9779a219aa94cf76d550ccba5e74d5fc4445d6e907626f033fad9e468161ad943815d032a32a499d67"
    "aa7d5960e811cf2d3c61e497372fad4b4bb5e31f31d23b5c0dfd261c4e470279e96d957c38b8da844e1a1a3fbe992f58b74753601bd56bcec815ac308deb5995"
)
package() {
    install -Dm644 "$srcdir/AppleColorEmoji.ttf" \
      "${pkgdir}/usr/share/fonts/apple-color-emoji/apple-color-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-apple-color-emoji.conf"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/75-apple-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

