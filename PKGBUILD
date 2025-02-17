# Contributor: Arzet Ro (arzeth0@gmail.com)

pkgname=python-word2number
pkgver=1.1
pkgrel=1
pkgdesc="Convert number words, e.g. three hundred and forty two, to numbers (342)."
arch=('any')
url="https://github.com/akshaynagpal/w2n"
license=('MIT')
depends=('python')
makedepends=('python-distribute' 'python-wheel' 'python-build' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/w/word2number/word2number-$pkgver.zip)
sha512sums=('03bf8933ab4cc0125120164b4525d89f37824d1131ff15257f42bddd00f8c34f2597922cb46f485b2083355626d05bfa57db38b2c911d0efcc3c60d9a49ccb64')

build() {
  cd "$srcdir"/word2number-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/word2number-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
