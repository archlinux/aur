# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get
pkgver=0.2.10
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python' 'python-setuptools')
optdepends=('python-colorama: for colored output')
provides=("pirate-get")
conflicts=("pirate-get-git")
source=('https://github.com/vikstrous/pirate-get/archive/v'${pkgver}'.tar.gz')
sha256sums=('d7b76bba4d34c0366c05773a2548367061bd9371fa8713f2ac2b39d347872c81')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root $pkgdir
}
