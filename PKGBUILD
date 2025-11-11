# Maintainer: Phil A. <flying-sheep@web.de>

pkgname=twemoji-mozilla-fontconfig
pkgver=1.0
pkgrel=3
pkgdesc="Use Mozilla version of Twitter Color Emoji."
url="https://github.com/mozilla/twemoji-colr"
arch=(any)
license=('Apache-2.0 AND CC-BY-4.0')
dependencies=('firefox')
provides=('emoji-font' 'twemoji-color-font')
source=("75-twemoji-mozilla.conf" "https://raw.githubusercontent.com/mozilla/twemoji-colr/refs/tags/v0.7.0/LICENSE.md")
sha256sums=('eaf4913c63acf186cb787023ce91a27508801fdac9d296ba83621d09686fd5fd'
            '64419edc28e9163204c3be73f835a8dfc34cd6c9b8f7d067bb685f119f839a99')

package() {
  install -dm755 "$pkgdir/usr/share/fonts/twemoji-mozilla"
  ln -s "/usr/lib/firefox/fonts/TwemojiMozilla.ttf" \
    "$pkgdir/usr/share/fonts/twemoji-mozilla/"
  install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.d" "$srcdir/75-twemoji-mozilla.conf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE.md"
}
