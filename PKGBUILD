# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Adhityaa Chandrasekar <c.adhityaa@gmail.com>

pkgname=python-unidiff
pkgver=0.7.0
pkgrel=3
pkgdesc='Simple Python library to parse and interact with unified diff data'
arch=('any')
url="https://github.com/matiasb/python-unidiff"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/u/unidiff/unidiff-$pkgver.tar.gz")
sha256sums=('91bb13b4969514a400679d9ae5e29a6ffad85346087677f8b5e2e036af817447')

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
