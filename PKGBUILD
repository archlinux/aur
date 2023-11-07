# Maintainer:  lili1228 <lili (at) lili (dot) lgbt>
# Contributor:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=python-pulsectl-asyncio
_srcname=pulsectl-asyncio
pkgver=1.1.1
pkgrel=1
pkgdesc="Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)"
arch=('any')
url="https://github.com/mhthies/pulsectl-asyncio"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:23.5.0')
makedepends=('python-setuptools')
source=("https://github.com/mhthies/pulsectl-asyncio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b495295ee13d54e136cd70daaf3675239aa96faa284bd2ad0d21496821ee818f67ebbe83269a4201ea0bee99b5b2b78be3945909e1b2519078bc38c2529734bf')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 ft=sh et:
