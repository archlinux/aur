# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Adhityaa Chandrasekar <c.adhityaa@gmail.com>

pkgname=python-unidiff
pkgver=0.6.0
pkgrel=3
pkgdesc='Simple Python library to parse and interact with unified diff data'
arch=('any')
url="https://github.com/matiasb/python-unidiff"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/u/unidiff/unidiff-$pkgver.tar.gz")
sha256sums=('90c5214e9a357ff4b2fee19d91e77706638e3e00592a732d9405ea4e93da981f')

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
