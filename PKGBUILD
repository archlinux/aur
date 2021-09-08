# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.42.1
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('any')
url='https://github.com/googleapis/python-storage'
license=('Apache')
depends=(
	'python>=3.6'
	'python-google-api-core>=1.29.0'
	'python-google-auth>=1.25'
	'python-google-cloud-core>=1.6.0'
	'python-google-resumable-media>=1.3.0'
	'python-protobuf'
	'python-requests>=2.18.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/python-storage/archive/v$pkgver.tar.gz")
sha256sums=('645000f0e16cdc5c0d98ffcd84a06ce4348db0314b4dff4204b84a2ab2cfc68e')

build() {
	cd "python-storage-$pkgver"
	python setup.py build
}

package() {
	cd "python-storage-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
