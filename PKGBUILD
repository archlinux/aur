# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

pkgname=commacd
pkgver=0.3.1
pkgrel=1
pkgdesc="A faster way to move around Bash"
arch=('any')
depends=('bash')
url="https://github.com/shyiko/commacd"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/shyiko/$pkgname/tar.gz/v$pkgver
        commacd.1)
sha256sums=('2b33bf9e9264216f70430b826ba3cb3d6f3b5260fa1255b9c852a5fc0bea8b57'
            'e1cf248eb023fb608432d97e92421d8a15cf3d8f2144b5b9a29c4e80653e1382')
install=commacd.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing man page...'
  install -Dm 644 "$srcdir/commacd.1" "$pkgdir/usr/share/man/man1/commacd.1"

  msg2 'Installing...'
  install -Dm 755 commacd.bash "$pkgdir/usr/share/$pkgname/commacd.bash"
}
