# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>

pkgname=python-ipaddress
_pyname=ipaddress
pkgver=1.0.22
pkgrel=1
pkgdesc='IPv4/IPv6 manipulation library'
arch=('x86_64')
url='https://github.com/phihag/ipaddress'
license=('custom:PSFL')
makedepends=('python-setuptools')
depends=('python')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('19b9a4e7ab0271a7f16b498cebe431d7d6179c7cd99626d918b5fa218f0ef8be')

build() {
  cd "${_pyname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
