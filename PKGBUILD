# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgbase=python-confight
pkgname=(python-confight)
pkgver=1.3.1
pkgrel=2
pkgdesc='One simple way of parsing configs.'
arch=('any')
url="https://github.com/Avature/confight"
license=('MIT')
makedepends=('python-setuptools')
source=(
  "https://pypi.io/packages/source/c/confight/confight-$pkgver.tar.gz"
  "LICENSE.txt"
)
md5sums=(
  '286c815e2ff36d1c74382e464c5d2d6d'
  'b62f1a403a498f2bc2240d7e85eceafe'
)

build() {
  cd "$srcdir"/confight-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/confight-$pkgver
  python setup.py test
}

package() {
  depends=('python')

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  cd confight-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
