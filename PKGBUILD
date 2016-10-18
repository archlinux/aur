# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>
# Contributor: Tristelune <tristelune [at] archlinux.info>

pkgname=noteshrink
pkgver=0.1.1
pkgrel=3
pkgdesc="Convert scans of handwritten notes to beautiful, compact PDFs"
url='https://mzucker.github.io/2016/09/20/noteshrink.html'
arch=('any')
license=('MIT')
depends=('python-numpy>=1.10' 'python-scipy' 'python-pillow' 'imagemagick')
makedepends=('python-setuptools')
conflicts=('noteshrink-git')
source=('https://pypi.python.org/packages/13/a3/95c92cd5c250d3eb21ced23d1a7d1dabb1546e565fa4cdeaa72586ef871e/'$pkgname'-'$pkgver'.tar.gz')
md5sums=('15dbdce38252e2209161cf415c3842f8')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
