# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Adhityaa Chandrasekar <c.adhityaa@gmail.com>

pkgname=python-unidiff
# https://github.com/matiasb/python-unidiff/blob/master/HISTORY
pkgver=0.7.4
pkgrel=1
pkgdesc='Simple Python library to parse and interact with unified diff data'
arch=('any')
url="https://github.com/matiasb/python-unidiff"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/u/unidiff/unidiff-$pkgver.tar.gz")
sha256sums=('2bbcbc986e1fb97f04b1d7b864aa6002ab02f4d8a996bf03aa6e5a81447d1fc5')

build() {
  cd unidiff-$pkgver
  python setup.py build
}

check() {
  cd unidiff-$pkgver
  python -m unittest discover -s tests
}

package() {
  cd unidiff-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
