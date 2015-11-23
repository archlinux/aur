# Maintainer:  dwayne <dwayne@oboj.net>

pkgname=rssdler
pkgver=0.4.2
pkgrel=2
pkgdesc="Utility to automatically download RSS enclosures"
arch=('any')
url="https://github.com/dwayne80/rssdler/"
license=('GPL2')
depends=('python2-feedparser')
source=(git+https://github.com/dwayne80/$pkgname.git
        config.txt)
md5sums=('SKIP'
         'f9bf928e97b4fd996e1c5854990adcad')

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 ../config.txt "$pkgdir/usr/share/$pkgname/config.txt"
  install -Dm644 userFunctions.py "$pkgdir/usr/share/$pkgname/postDownloadFunctions.py"
}
