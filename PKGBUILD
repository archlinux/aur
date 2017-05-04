# Maintainer: Sergej "winnie" Schmidt <sergej@hex.house>

_py="python"
_eggname="arpreq"
pkgname=${_py}-${_eggname}
pkgver=0.3.2
pkgrel=1
pkgdesc="Python C extension to query the Kernel ARP cache for the MAC address of a given IP address."
arch=('any')
url="https://pypi.python.org/pypi/arpreq/"
license=('MIT')
depends=("${_py}")
makedepends=("${_py}-setuptools")
options=(!emptydirs)
source=(${_eggname}-${pkgver}.tar.gz::https://github.com/sebschrader/python-arpreq/archive/v${pkgver}.tar.gz)
provides=('python-arpreq')
sha256sums=('6cbf082d1f1d3952b72fb907c0e577b920c1101b54a8a4bd34c32771851f012f')

package() {
  cd "${srcdir}/${_py}-${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
