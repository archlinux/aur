# Maintainer: Valerii Huz <ghotrix@gmail.com>

pkgname=komodo-10
pkgver=10
pkgrel=1
_pkgdir=_ae4bdf
pkgdesc="Freeware version of the Komodo chess engine (~3347 Elo)"
arch=(x86_64)
url=https://komodochess.com
license=(custom)
conflicts=(komodo-engine komodo-9)
source=(http://komodochess.com/pub/${pkgname%-*}-$pkgver.zip
        http://komodochess.com/pub/Komodo3-book.zip
        COPYING)
sha256sums=(b2b511b968a46d9e32535a227f98b425fd89e1224a496d0efdc81b66aa2e6743
            3ada9836a4b8a8bdbc362c90bce1b63b9472fc0194e39d9d36119ba102e9e9cd
            0d81e7e34a9563047580052052646c5ebb656a39a4575043e0fef6f7704cb18b)

package() {
  cd ${pkgname%-*}-$pkgver$_pkgdir
  install -Dm755 Linux/${pkgname%-*}-$pkgver-linux "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 ../Book.bin "$pkgdir"/usr/share/$pkgname/book.bin
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
  install -dm755 "$pkgdir"/usr/share/doc/${pkgname}/
  install -m644 *.* "$pkgdir"/usr/share/doc/${pkgname}/
}
