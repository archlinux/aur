# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=noteshrink
pkgver=0.1.0
pkgrel=1
pkgdesc="Convert scans of handwritten notes to beautiful, compact PDFs"
url='https://mzucker.github.io/2016/09/20/noteshrink.html'
arch=('any')
license=('MIT')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-pillow')
source=('https://pypi.python.org/packages/4a/2f/9f3e67bf054f88d79a3af567d97106e33ec0cf12cf755b1810c6ad7dcd3b/noteshrink-0.1.0.tar.gz')
md5sums=('713e0ed307fbc19a9413d71aa6ba95aa')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i '1 s/python/python2/g' noteshrink.py
    python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
