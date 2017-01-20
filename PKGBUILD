# Maintainer: archlinux.info:tdy

pkgname=andscacs-engine
pkgver=0.89
pkgrel=1
pkgdesc="A UCI chess engine (~3239 Elo)"
arch=(x86_64)
url=http://www.andscacs.com
license=(custom)
source=(http://www.andscacs.com/${pkgname%-*}${pkgver/.}.zip)
sha256sums=(0ee9344538dcf4449d71b9ea55a9c4affee9e5454f54dd9c35bb573e8c691af7)

package() {
  install -Dm755 linux/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 readme.txt "$pkgdir"/usr/share/doc/${pkgname%-*}/README
  sed -n '1,7p' readme.txt > COPYING
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname%-*}/COPYING
}
