# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get
pkgver=0.2.8
pkgrel=1
pkgdesc='A command line interface for the Pirate Bay'
arch=('any')
url='https://github.com/vikstrous/pirate-get/'
license=('AGPL')
depends=('python')
optdepends=('python-colorama: for colored output')
provides=("pirate-get")
conflicts=("pirate-get-git")
source=('https://github.com/vikstrous/pirate-get/archive/v'${pkgver}'.tar.gz')
sha256sums=('db3c9e86157c3a4f83cf7a974587c93320b6d091b3310f57b9f3921253c10ba5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root $pkgdir
}
