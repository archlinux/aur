# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=cozy-indexer
pkgver=1.0.6
pkgrel=1
epoch=
pkgdesc="REST API for data indexation, to be used with Cozy"
arch=('any')
url="https://github.com/cozy/cozy-data-indexer"
license=('GPL3')
depends=('python2' 'python2-dateutil' 'python2-whoosh' 'python2-tornado' 'git')
optdepends=()
makedepends=()
provides=('cozy-indexer')
source=(git+https://github.com/cozy/cozy-data-indexer)
sha256sums=('SKIP')

build() {
	cd cozy-data-indexer
	python2 ./setup.py build
}

package() {
	cd cozy-data-indexer
	mkdir -p $pkgdir"/usr/lib/python2.7/site-packages"
	export PYTHONPATH=$pkgdir"/usr/lib/python2.7/site-packages/"
	python2 ./setup.py install --prefix=$pkgdir"/usr"
}
