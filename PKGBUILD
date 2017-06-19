# Maintainer: Jan Tojnar <jtojnar@gmail.com>
_pkgname='hamster-lib'
pkgname="python-${_pkgname}"
pkgver='0.13.1'
pkgrel=1
pkgdesc="A library for common timetracking functionality."
url="https://github.com/projecthamster/hamster-lib"
depends=('python' 'python-appdirs' 'python-future' 'python-icalendar' 'python-sqlalchemy' 'python-six')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://github.com/projecthamster/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bb0c0a442ce7a753c54b13fa7f1b3d9e0eda2c77e380dba9274a71ae63ec634a')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed 's/find_packages()/find_packages(exclude=["tests"])/;s/.*configparser.*//g' -i setup.py
	python setup.py install --root="${pkgdir}" --optimize=1
}
