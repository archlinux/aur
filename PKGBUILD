# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=tldr-python-client
pkgver='0.3'
pkgrel=2
pkgdesc='Command line client for tldr, a collection of simplified and community-driven man pages.'
url='https://github.com/tldr-pages/tldr-python-client'
provides=('tldr-client')
conflicts=('tldr-client')
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
_commit='2e6d55f938909c3bd754887b094c4f6951d656a9'
source=("git+https://github.com/tldr-pages/${pkgname}.git#commit=${_commit}")
md5sums=('SKIP')


build() {
	cd "${srcdir}/${pkgname}"

	python setup.py build
}


package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

