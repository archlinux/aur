# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfdnormalize
pkgver=1.1.1
pkgrel=3
pkgdesc='SFD normalizer, discards GUI information from SFD files'
arch=(any)
url="https://github.com/alerque/$pkgname"
license=(CC0-1.0)
depends=(python
         python-sfdutf7)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4713ecd4d58cc6f2d0a195af61f57ae8e141027f40d49cf418357b5325f681d0')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
