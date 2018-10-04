pkgname=komodo-9
pkgver=9
pkgrel=02
_pkgdir=_9dd577
pkgdesc="Freeware version of the Komodo chess engine (~3310 Elo)"
arch=(x86_64)
url=https://komodochess.com
license=(custom)
conflicts=(komodo-engine)
source=(http://komodochess.com/pub/${pkgname%-*}-$pkgver.zip
        http://komodochess.com/pub/Komodo3-book.zip
        COPYING)
sha256sums=(97d0f7c4e5d23f43d3d2cccc6b9bd27cb61fe56b88a57d76fdbefeefad8900ca
            3ada9836a4b8a8bdbc362c90bce1b63b9472fc0194e39d9d36119ba102e9e9cd
            0d81e7e34a9563047580052052646c5ebb656a39a4575043e0fef6f7704cb18b)

package() {
  cd ${pkgname%-*}-$pkgver$_pkgdir
  install -Dm755 Linux/${pkgname%-*}-$pkgver.$pkgrel-linux "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 ../Book.bin "$pkgdir"/usr/share/$pkgname/book.bin
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
  install -dm755 "$pkgdir"/usr/share/doc/${pkgname}/
  install -m644 *.* "$pkgdir"/usr/share/doc/${pkgname}/
}
