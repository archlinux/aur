# Maintainer: Matthew Ellison <seglberg+aur@gmail.com>

_pkgname='pyroute2'
pkgname="python-${_pkgname}"
pkgver=0.4.21
pkgrel=1
pkgdesc='A pure Python netlink and Linux network configuration library.'
arch=('any')
url='http://docs.pyroute2.org/'
license=('GPL2' 'Apache')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7afad28ee0a0f3e7c34adaa9f953d00560ed9910203e93f107833b6e8d151171')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
