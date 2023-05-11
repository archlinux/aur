# Maintainer: archlinux.info:tdy

pkgname=komodo-engine
pkgver=14.1
pkgrel=1
pkgdesc="Freeware version of the Komodo chess engine (~3394 Elo)"
arch=(x86_64)
url=https://komodochess.com
license=(custom)
install=$pkgname.install
source=(http://komodochess.com/pub/${pkgname%-*}-${pkgver/.*}.zip
        http://komodochess.com/pub/Komodo3-book.zip
        COPYING)
sha256sums=(dbb073aa5cbfd859b7449f825d9748b2dc05409fa4710c880eeab25ab6a8b724
            3ada9836a4b8a8bdbc362c90bce1b63b9472fc0194e39d9d36119ba102e9e9cd
            0d81e7e34a9563047580052052646c5ebb656a39a4575043e0fef6f7704cb18b)

package() {
  cd "$srcdir"/${pkgname%-*}-${pkgver%.*}

  install -Dm755 Linux/${pkgname%-*}-$pkgver-linux-bmi2 "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm755 Linux/${pkgname%-*}-$pkgver-linux "$pkgdir"/usr/bin/${pkgname%-*}-generic

  install -Dm644 ../Book.bin "$pkgdir"/usr/share/$pkgname/book.bin
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  install -Dm644 READMEk$pkgver.html "$pkgdir"/usr/share/doc/$pkgname/READMEk$pkgver.html
  install -Dm644 setHash.txt "$pkgdir"/usr/share/doc/$pkgname/setHash.txt
}
