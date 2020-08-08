# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver='1.6.0'
pkgrel=1
pkgdesc="Python API client for Jellyfin"
arch=('any')
url='https://github.com/iwalton3/jellyfin-apiclient-python'
license=('GPL3')
depends=('python>=3.6' 'python-requests' 'python-urllib3' 'python-websocket-client' 'python-six')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/j/jellyfin-apiclient-python/jellyfin-apiclient-python-$pkgver.tar.gz")
sha256sums=('25a90aa7c0e26f820c9fd14b02780ba8bca1d363324027f8aa28474e9924f135')

build() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
