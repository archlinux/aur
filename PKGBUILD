# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='pyroute2'
pkgname="python-${_pkgname}"
pkgver=0.3.21
pkgrel=1
pkgdesc='A pure Python netlink and Linux network configuration library.'
arch=('any')
url='http://docs.pyroute2.org/'
license=('GPL2' 'Apache')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/p/pyroute2/pyroute2-${pkgver}.tar.gz")
sha256sums=('8bbad4a32d52529126c35101abf6168416e907a066ada2499b1f68c8b25f2afb')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
