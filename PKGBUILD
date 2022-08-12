# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfdnormalize
pkgver=1.1.0
pkgrel=1
pkgdesc='SFD normalizer, discards GUI information from SFD files'
arch=(any)
url="https://github.com/alerque/$pkgname"
license=(CCO)
depends=(python
         python-sfdutf7)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('638ed0a7dab3f7c20eee9ef3803357c7e9b01cf4bdc30ba0de94a7dd2c1ca19c')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
