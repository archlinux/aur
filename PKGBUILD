# Maintainer: archlinux.info:tdy

pkgname=critter-engine
pkgver=1.6a
pkgrel=3
pkgdesc="A UCI chess engine (~3168 Elo)"
arch=(i686 x86_64)
url=http://www.vlasak.biz/critter
license=(custom)
source=($pkgname-$pkgver.zip::http://www.vlasak.biz/${pkgname%-*}/countl.php
        COPYING)
sha256sums=(c43743def81c31fd690d610fd53a64f4d99d478ffc301ad8628aac841682a4a7
            c058b6621ec706a363b0012edb3ff0066321d9aa7709645f72af29fab7449274)
[[ $CARCH == i686 ]] && _pkgver=${pkgver/.}-32bit || _pkgver=${pkgver/.}-64bit

package() {
  install -Dm755 ${pkgname%-*}-$_pkgver "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 book.cbk "$pkgdir"/usr/share/$pkgname/book.cbk
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
