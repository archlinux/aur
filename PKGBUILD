# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Adhityaa Chandrasekar <c.adhityaa@gmail.com>

pkgname=python-unidiff
# https://github.com/matiasb/python-unidiff/blob/master/HISTORY
pkgver=0.7.3
pkgrel=1
pkgdesc='Simple Python library to parse and interact with unified diff data'
arch=('any')
url="https://github.com/matiasb/python-unidiff"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/u/unidiff/unidiff-$pkgver.tar.gz")
sha256sums=('d5f2e53a9a00db3224a8c36349b5380e0e22d1aec6c694b14fb9483ee93c6205')

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
