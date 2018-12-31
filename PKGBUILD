# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=18.8.0
pkgrel=1
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('1951ffd3eed030c33378d925d6b5b36e30070a0ebe5c6315c484452adf7248a1bc4628f5e9fba8cb03c3e918e24aecb39df8ebb2198b66fb45f93bdfe2730550')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  python -m tests.test_bugbear
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
