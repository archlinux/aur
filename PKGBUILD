# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='pyroute2'
pkgname="python-${_pkgname}"
pkgver=0.4.4
pkgrel=1
pkgdesc='A pure Python netlink and Linux network configuration library.'
arch=('any')
url='http://docs.pyroute2.org/'
license=('GPL2' 'Apache')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('794cafb9f1b7fe9f2d74be888b6cd3093a6fc2fb727fa0537319f906f9f196b8')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
