# Maintainer: archlinux.info:tdy

pkgname=andscacs-engine
pkgver=0.90
pkgrel=1
pkgdesc="A UCI chess engine (~3239 Elo)"
arch=(x86_64)
url=http://www.andscacs.com
license=(custom)
source=(http://www.andscacs.com/downloads/${pkgname%-*}${pkgver/.}.zip)
sha256sums=(605f4454082691fc6595d184213c9a18970d56b24c0ac2a553fc68b9f2af92d4)

package() {
  install -Dm755 linux/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 readme.txt "$pkgdir"/usr/share/doc/${pkgname%-*}/README
  sed -n '1,7p' readme.txt > COPYING
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname%-*}/COPYING
}
