# Maintainer: archlinux.info:tdy

pkgname=komodo-engine
pkgver=13.02
_hash=_201fd6
pkgrel=1
pkgdesc="Freeware version of the Komodo chess engine (~3394 Elo)"
arch=(x86_64)
url=https://komodochess.com
license=(custom)
install=$pkgname.install
source=(http://komodochess.com/pub/${pkgname%-*}-${pkgver/.*}.zip
        http://komodochess.com/pub/Komodo3-book.zip
        COPYING)
sha256sums=('34a7fc91ac3c28bc28df5ca9913b3122fa1e882f88cd25a7626b8ecf11cec98d'
            '3ada9836a4b8a8bdbc362c90bce1b63b9472fc0194e39d9d36119ba102e9e9cd'
            '0d81e7e34a9563047580052052646c5ebb656a39a4575043e0fef6f7704cb18b')

package() {
  cd "$srcdir"/${pkgname%-*}-${pkgver%.*}$_hash

  install -Dm755 Linux/${pkgname%-*}-$pkgver-linux-bmi2 "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm755 Linux/${pkgname%-*}-$pkgver-linux "$pkgdir"/usr/bin/${pkgname%-*}-generic

  install -Dm644 ../Book.bin "$pkgdir"/usr/share/$pkgname/book.bin
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  install -Dm644 READMEk$pkgver.html "$pkgdir"/usr/share/doc/$pkgname/READMEk$pkgver.html
  install -Dm644 setHash.txt "$pkgdir"/usr/share/doc/$pkgname/setHash.txt
}
