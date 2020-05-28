# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=20.1.4
pkgrel=1
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs' 'python-setuptools')
# checkdepends=('python-hypothesis')  XXX: Other checkdepends are not packaged.
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('56c41393dbc36abc1fa71f6f8b7aebc0d69ac9f95ee92726655930cb5178c3c32a3ee69c9100d1dcb441eea5dd32877e668e0ae44e0ad1fe40b7694d7070e983')

build() {
  cd $_name-$pkgver
  python setup.py build
}

# check() {
#   cd $_name-$pkgver
#   python -m tests.test_bugbear
# }

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
