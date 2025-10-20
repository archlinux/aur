# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
pkgname=python-whois
_name=python_whois
pkgver=0.9.6
pkgrel=1
pkgdesc='Whois querying and parsing of domain registration information'
arch=(any)
url=https://pypi.org/project/python-whois/
license=(MIT)
depends=(python python-dateutil python-pysocks)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2e6de7b6d70e305a85f4859cd17781ee3f0da3a02a8e94f23cb4cdcd2e400bfa')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
