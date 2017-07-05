# Maintainer: Matthew Ellison <seglberg@gmail.com>

_pkgname='pyroute2'
pkgname="python-${_pkgname}"
pkgver=0.4.17
pkgrel=1
pkgdesc='A pure Python netlink and Linux network configuration library.'
arch=('any')
url='http://docs.pyroute2.org/'
license=('GPL2' 'Apache')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8ae522eaf46281df32f54632b1015b02f650304d5107e56b96912fb7cf1734e6')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
