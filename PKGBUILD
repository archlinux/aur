# Maintainer: Valerii Huz <ghotrix@gmail.com>

pkgname=komodo-11
pkgver=11
pkgrel=1
_pkgdir=_386a7a
pkgdesc="Freeware version of the Komodo chess engine (~3384 Elo)"
arch=(x86_64)
url=https://komodochess.com
license=(custom)
conflicts=(komodo-engine komodo-9 komodo-10)
source=(http://komodochess.com/pub/${pkgname%-*}-$pkgver.zip
        http://komodochess.com/pub/Komodo3-book.zip
        COPYING)
sha256sums=(e335091f78200b254c140d2dc7c67ca52b950085ed3a9f55966c78d2f9a6d9d5
            3ada9836a4b8a8bdbc362c90bce1b63b9472fc0194e39d9d36119ba102e9e9cd
            0d81e7e34a9563047580052052646c5ebb656a39a4575043e0fef6f7704cb18b)

package() {
  cd ${pkgname%-*}-$pkgver$_pkgdir
  install -Dm755 Linux/${pkgname%-*}-$pkgver.01-linux "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 ../Book.bin "$pkgdir"/usr/share/$pkgname/book.bin
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
  install -dm755 "$pkgdir"/usr/share/doc/${pkgname}/
  install -m644 *.* "$pkgdir"/usr/share/doc/${pkgname}/
}
