# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=seaborn
pkgname=python2-$_pkgname
pkgver=0.5.1
pkgrel=1
pkgdesc="Statistical data visualization"
arch=("any")
url="http://www.stanford.edu/~mwaskom/software/seaborn/index.html"
license=('BSD')
depends=('python2-pandas' 'python2-matplotlib' 'python2-scipy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz" "LICENSE")
md5sums=('2ce6ea7d3c67858c0b1f5793fa2043b8'
         'b6509e5b306ad6447d7c2fc2f8de8dcb')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

