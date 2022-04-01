# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Buehler <account@buehler.de>

_name=pykwalify
pkgname=python-pykwalify
pkgver=1.8.0
pkgrel=3
pkgdesc='Python lib/cli for JSON/YAML schema validation'
arch=('any')
url=https://github.com/Grokzen/pykwalify
license=('MIT')
depends=('python-dateutil' 'python-docopt' 'python-ruamel-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-testfixtures')
provides=('pykwalify')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('796b2ad3ed4cb99b88308b533fb2f559c30fa6efb4fa9fda11347f483d245884')
b2sums=('1593f5e3e15188929574ece60bf6818438258bf024d105ae26323a97a202ac69001a15ca6daaa430970af3659c49da745bcf1f77c23ac72bed2ddca14440d943')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
