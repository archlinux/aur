# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver='1.9.1'
pkgrel=1
pkgdesc="Python API client for Jellyfin"
arch=('any')
url='https://github.com/iwalton3/jellyfin-apiclient-python'
license=('GPL3')
depends=('python>=3.6' 'python-requests' 'python-urllib3' 'python-websocket-client' 'python-six' 'python-certifi')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/j/jellyfin-apiclient-python/jellyfin-apiclient-python-$pkgver.tar.gz")
b2sums=('8d0c889471f97b0605d18c3fade60d42c0d89b2b6b6b294c25256648829f13f23fbf7ed427587110f9d95247c5704354e295b73d6d8e94a471d0c6d533b3fd84')

build() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
