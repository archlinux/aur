# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

_pkgname=plac
pkgname=python-${_pkgname}
pkgver=1.3.4
pkgrel=1
pkgdesc='The smartest command line arguments parser in the world'
url='https://pypi.org/project/plac/'
depends=(python)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c91a4c9f9cc67c7e7213b6823b0ea15cd0afe5eaf8f8dda1fe5cb10192b137f5')


build() {
	cd "plac-${pkgver}"
	python setup.py build
}

package() {
	cd "plac-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}
