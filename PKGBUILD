# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=python-tldr
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
_repo='tldr-python-client'
source=("https://github.com/tldr-pages/${_repo}/archive/${pkgver}.tar.gz")
md5sums=('fcb6a4a4e4cbd00ddbd814958e865395')


build() {
	cd "${srcdir}/${_repo}-${pkgver}"
	python setup.py build
}


package() {
	cd "${srcdir}/${_repo}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

