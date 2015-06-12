# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-tsne
pkgver=0.1
pkgrel=1
pkgdesc="Python library containing T-SNE algorithms"
arch=('any')
license=('BSD')
url="https://github.com/danielfrg/tsne"
depends=('python2-numpy-openblas')
source=("https://pypi.python.org/packages/source/t/tsne/tsne-$pkgver.tar.gz")
md5sums=('b534c85f7f4dda6b42a02978d8722e6e')

build() {
  cd "$srcdir/tsne-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/tsne-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
