# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
pkgname=python-whois
_name=python_whois
pkgver=0.9.5
pkgrel=2
pkgdesc='Whois querying and parsing of domain registration information'
arch=(any)
url=https://pypi.org/project/python-whois/
license=(MIT)
depends=(python python-dateutil python-pysocks)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18968c21484752fcc4b9a5f0af477ef6b8dc2e8bb7f1bd5c33831499c0dd41ca')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
