pkgname=python2-editdist
_pkgname=py-editdist
pkgver=0.3
pkgrel=1
pkgdesc='A Python module to calculate the Levenshtein edit distance between two strings.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/py-editdist/'
license=('custom:ISC/BSD')
depends=('python2')
source=("http://py-editdist.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
sha256sums=('17c5bd2852cd4eab27482a419a73b07deda0b09e40b8057d6fafba53eca7c5e9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
