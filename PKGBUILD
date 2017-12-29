# Maintainer: winnie <aur@msgpeek.net>

_py="python"
_eggname="arpreq"
pkgname=${_py}-${_eggname}
pkgver=0.3.3
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
sha256sums=('1760783a2278654d5aeecd4d73f84f3ae7c44ded1ec606066c8582a2339a34e3')

package() {
  cd "${srcdir}/${_py}-${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
