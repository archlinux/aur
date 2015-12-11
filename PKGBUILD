# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='pyroute2'
pkgname="python-${_pkgname}"
pkgver=0.3.15
pkgrel=1
pkgdesc='A pure Python netlink and Linux network configuration library.'
arch=('any')
url='http://docs.pyroute2.org/'
license=('GPL2' 'Apache')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/p/pyroute2/pyroute2-${pkgver}.tar.gz")
sha256sums=('f5b7116fd97f73f97adc3b9c040a4ddbe61f18bb02f47e1c8399567c8791d270')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
