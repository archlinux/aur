# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-pycode-similar
pkgver=1.3
pkgrel=1
pkgdesc="A simple plagiarism detection tool for python code"
arch=('any')
url="https://github.com/fyrestone/pycode_similar"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pycode_similar/pycode_similar-$pkgver.tar.gz")
sha256sums=('b3419acb9815336dd00ee2a538a7bb2459b1e7d919dda8f576bbb67b5a2546c6')

build() {
  cd "$srcdir"/pycode_similar-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/pycode_similar-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
