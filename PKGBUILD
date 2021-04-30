# Maintainer: Valerii Huz <ghotrix@gmail.com>

pkgname=komodo-free
pkgver=12
pkgrel=1
pkgminor=1
_pkgdir=_5a8fc2
pkgdesc="Freeware version of the Komodo chess engine (~3384 Elo)"
arch=(x86_64)
url=https://komodochess.com
license=(custom)
conflicts=(komodo-engine komodo-9 komodo-10 komodo-11)
source=(http://komodochess.com/pub/${pkgname%-*}-$pkgver.zip
        http://komodochess.com/pub/Komodo3-book.zip
        COPYING)
sha256sums=(3db04ce05b696fa103c8157d2be2c2adf13bf0607d9842fffa8b90104b79a745
            3ada9836a4b8a8bdbc362c90bce1b63b9472fc0194e39d9d36119ba102e9e9cd
            0d81e7e34a9563047580052052646c5ebb656a39a4575043e0fef6f7704cb18b)

package() {
  cd ${pkgname%-*}-$pkgver.$pkgrel.$pkgminor$_pkgdir
  install -Dm755 Linux/${pkgname%-*}-$pkgver.$pkgrel.$pkgminor-linux "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 ../Book.bin "$pkgdir"/usr/share/$pkgname/book.bin
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
  install -dm755 "$pkgdir"/usr/share/doc/${pkgname}/
  install -m644 *.* "$pkgdir"/usr/share/doc/${pkgname}/
}
