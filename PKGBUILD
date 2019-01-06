# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=hidapi-cffi
pkgname=python-$_name
pkgver=0.2.2
pkgrel=2
pkgdesc="CFFI wrapper for hidapi"
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('BSD')
depends=('python-cffi')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jbaiter/hidapi-cffi/master/LICENSE.txt")
sha512sums=('e72ca5050dc1d877ad28e1bab46fadd94ada3ba2e2c8b0b4c3a40559f982a36f41018ff068c6c0c9c3d74e61f59e7bc6130e1b34be3d97f1d8cd30065c072070'
            'fe538de4f6243ccb315f292d02bf540b0731e7dafa88d068473d3e7608c9c4e1567e0d4fc7177162e632398aeb0e7c682dad7cffe552ee46ca25fd640b69d106')

package() {
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
