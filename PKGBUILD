pkgname=p2ascii
pkgver=1.0.1
pkgrel=1
pkgdesc="Image to ASCII art converter with optional color and edge-based rendering"
arch=('any')
url="https://github.com/Hugana/p2ascii"
license=('MIT')
depends=('python' 'opencv' 'python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hugana/p2ascii/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41607c7ebf0e1486d16d44af3dc1da79612dd15b880e3d790330b155b7b96e3b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/$pkgname/Images"
  install -m755 p2ascii.py "$pkgdir/usr/share/$pkgname/"
  install -m644 Images/*.png "$pkgdir/usr/share/$pkgname/Images/"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/p2ascii.py" "$pkgdir/usr/bin/p2ascii"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
