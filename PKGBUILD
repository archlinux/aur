# Maintainer: Frederic Bezies < fredbezies at gmail dot com> 
# Contributor: archlinux.info:tdy

pkgname=andscacs-engine
pkgver=0.95
pkgrel=1
pkgdesc="A UCI chess engine (~3239 Elo)"
arch=(x86_64)
url=http://www.andscacs.com
license=(custom)
source=(http://www.andscacs.com/downloads/${pkgname%-*}${pkgver/.}.zip)
sha256sums=('b691c46da0de664815d93a46db52783f8beb08fb035adb4c7286322d231372f7')

package() {
  install -Dm755 linux/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 readme.txt "$pkgdir"/usr/share/doc/${pkgname%-*}/README
  sed -n '1,7p' readme.txt > COPYING
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname%-*}/COPYING
}
