# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver=1.9.2
pkgrel=3
pkgdesc='Python API client for Jellyfin'
arch=(any)
url=https://github.com/iwalton3/jellyfin-apiclient-python
license=(GPL-3.0-only)
depends=(python python-requests python-urllib3 python-websocket-client python-certifi)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ba12075a54df646c02fe437c576e3a19f38082080e6c136d88abf45f2eaba5d308259f16df46b4c7a5d76978ebf3392111fd0b3b3d2ee2c9496acf64fb8553b6')

build() {
	cd jellyfin-apiclient-python-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd jellyfin-apiclient-python-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
