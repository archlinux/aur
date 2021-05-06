# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_name=flake8-efm
pkgname=python-flake8-efm
pkgver=1.0.0
pkgrel=1
pkgdesc='Flake8 plugin for EFM-compatible output.'
arch=('any')
url=https://git.sr.ht/~whynothugo/flake8-efm
license=('ISC')
depends=('flake8' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('3936880f8f7651af8e4638e132a3b73c9c7fa582928b21e753d1199acb27df0388fbf45caeca3c79372a53ee88b449e98a4d251d6a69d54d3d8100f63249e433')

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
