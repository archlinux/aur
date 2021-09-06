# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.42.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('any')
url='https://github.com/googleapis/python-storage'
license=('Apache')
depends=(
	'python3'
	'python>=3.6'
	'python-google-api-core>=1.29.0'
	'python-google-auth>=1.25'
	'python-google-cloud-core>=1.6.0'
	'python-google-resumable-media>=1.3.0'
	'python-protobuf'
	'python-requests>=2.18.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/python-storage/archive/v$pkgver.tar.gz")
sha256sums=('4c17424d410d46a22359c4346c7324c2522433649003227599527ed3ce03a2f5')

build() {
	cd "python-storage-$pkgver"
	python setup.py build
}

package() {
	cd "python-storage-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
