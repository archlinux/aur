# Maintainer: aksr <aksr at t-com dot me>
pkgname=nsudoku
pkgver=1.3
pkgrel=1
pkgdesc="A ncurses-based Sudoku puzzle game."
arch=('i686' 'x86_64')
url="https://www.tbmatuka.com/nsudoku/"
license=('MIT')
depends=('ncurses')
source=("http://www.tbmatuka.com/$pkgname/$pkgname-$pkgver.c"
        "http://www.tbmatuka.com/$pkgname/LICENSE-$pkgver")
md5sums=('cae8ddb55879427631d995a2e6b16e55'
         '9db7d0019667301f05d66f9418d8bf6e')
sha1sums=('6d5c5ba455696be54358d3c352d8ebc6f8ed880b'
          '71324eb52a3f8e99cb713f3f7083ebb180ac420d')
sha256sums=('9595d449dde9a3b93bfaf3f6fdb3ae2669008935fe902bd73f742c81af6bbba4'
            'd8dd8104c52f92a0cc14869b92aeada6b5594a665e98c048831e7e1bb5e03bf0')

build() {
  cd "$srcdir"
  gcc -o $pkgname $pkgname-$pkgver.c -lncurses
}

package() {
  cd "$srcdir"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE-$pkgver $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

