pkgname=p2ascii
pkgver=1.0.0
pkgrel=1
pkgdesc="Image to ASCII art converter with optional color and edge-based rendering"
arch=('any')
url="https://github.com/Hugana/p2ascii"
license=('MIT')
depends=('python' 'opencv' 'python-numpy' 'python-opencv')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Hugana/p2ascii/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('f312fd51e717ce6adb7b645ede5d5c312519670b364c104b29f5cb9e10561c86')

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
