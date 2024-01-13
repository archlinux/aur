# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver=1.9.2
pkgrel=2
pkgdesc="Python API client for Jellyfin"
arch=(any)
url='https://github.com/iwalton3/jellyfin-apiclient-python'
license=(GPL3)
depends=(python-requests python-urllib3 python-websocket-client python-six python-certifi)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://pypi.python.org/packages/source/j/jellyfin-apiclient-python/jellyfin-apiclient-python-$pkgver.tar.gz")
b2sums=('4d8547e33a151678824abf6bc055dee984f61c7b550fa404751c648f53817b291260ec855d0788e46c3cdf1f3b907832fb65a7ffbf84fbdb56fa0ccdee25fcc9')

build() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
