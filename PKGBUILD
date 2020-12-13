# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver='1.6.2'
pkgrel=1
pkgdesc="Python API client for Jellyfin"
arch=('any')
url='https://github.com/iwalton3/jellyfin-apiclient-python'
license=('GPL3')
depends=('python>=3.6' 'python-requests' 'python-urllib3' 'python-websocket-client' 'python-six')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/j/jellyfin-apiclient-python/jellyfin-apiclient-python-$pkgver.tar.gz")
sha256sums=('b4560c4186e7153253919b49f9901258beaab1ffc22bb1334d8ba4666ff00602')

build() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/jellyfin-apiclient-python-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
