# Maintainer: Phil A. <flying-sheep@web.de>

pkgname=twemoji-mozilla-fontconfig
pkgver=1.0
pkgrel=2
pkgdesc="Use Mozilla version of Twitter Color Emoji."
url="https://github.com/mozilla/twemoji-colr"
arch=(any)
license=('Apache-2.0 AND CC-BY-4.0')
dependencies=('firefox')
provides=('emoji-font' 'twemoji-color-font')
source=("75-twemoji-mozilla.conf" "$url/blob/v0.7.0/LICENSE.md")
sha256sums=('eaf4913c63acf186cb787023ce91a27508801fdac9d296ba83621d09686fd5fd'
            'c95daf44f3ea26eb00153ae49f5e7d461ca3f1363ad52c8633c21dd8213c21d7')

package() {
  install -dm755 "$pkgdir/usr/share/fonts/twemoji-mozilla"
  ln -s "/usr/lib/firefox/fonts/TwemojiMozilla.ttf" \
    "$pkgdir/usr/share/fonts/twemoji-mozilla/"
  install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.d" "$srcdir/75-twemoji-mozilla.conf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE.md"
}
