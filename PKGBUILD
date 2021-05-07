# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_name=flake8-efm
pkgname=python-flake8-efm
pkgver=1.0.1
pkgrel=1
pkgdesc='Flake8 plugin for EFM-compatible output.'
arch=('any')
url=https://git.sr.ht/~whynothugo/flake8-efm
license=('ISC')
depends=('flake8' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('c8196f951f22d989405dd2d159c616532c8b1bb33d8d6761362cdbb66a6bbbdbe31ee134dc4883ef04421d37562d501797c5f09dedaf800aa01329a2168e4a55')

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
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENCE
}
