# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=tldr-python-client
pkgver='0.3'
pkgrel=1
pkgdesc='Command line client for tldr, a collection of simplified and community-driven man pages.'
url='https://github.com/tldr-pages/tldr-python-client'
provides=('tldr-client')
conflicts=('tldr-client')
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/tldr-pages/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('fcb6a4a4e4cbd00ddbd814958e865395')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}


package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

