# Contributor: Pellegrino Prevete

pkgname=python2-imagesize
pkgver=1.2.0
pkgrel=1

pkgdesc='Getting image size from png/jpeg/jpeg2000/gif file'
url='https://github.com/shibukawa/imagesize_py'
arch=('any')
license=('MIT')

depends=('python2')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/source/i/imagesize/imagesize-$pkgver.tar.gz")

sha256sums=('b1f6b5a4eab1f73479a50fb79fcf729514a900c341d8503d62a62dbc4127a2b1')

build() {
  cd "$srcdir"/imagesize-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/imagesize-$pkgver
  python2 -m unittest discover -v
}

package() {
  cd imagesize-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
