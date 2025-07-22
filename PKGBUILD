# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=18.4
pkgrel=2
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-linux'
license=('custom')
provides=(emoji-font)
install="${pkgname}.install"
source=(
    "AppleColorEmoji-$pkgver.ttf::$url/releases/download/v$pkgver/AppleColorEmoji.ttf"
    "75-apple-color-emoji.conf"
)
sha512sums=('b9414e1e376e0d569df2e8d8900bb166232d6db2184e3098390ea092f01b2e113481a13d80818260006824586f3077c9f8a0893fa4231fcf477b137885673d1e'
            'aa7d5960e811cf2d3c61e497372fad4b4bb5e31f31d23b5c0dfd261c4e470279e96d957c38b8da844e1a1a3fbe992f58b74753601bd56bcec815ac308deb5995')
package() {
    install -Dm644 "$srcdir/AppleColorEmoji-$pkgver.ttf" \
      "${pkgdir}/usr/share/fonts/apple-color-emoji/apple-color-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-apple-color-emoji.conf"
}

