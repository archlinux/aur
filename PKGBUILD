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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('36e754431318cff665457d6c5e5d60a22b16b124a54478d6336258d8d5db97eb9b6bac45b0f8f0d728d3b3f66447fae4be4c80c107deb55b6d1e7e739b42c4d8')

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
