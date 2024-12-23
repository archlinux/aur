# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=2.1.0
pkgrel=4
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
depends=(python
         python-gitpython
         python-fonttools)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('c8f36e1413a94cd58f64e519681be12e019d78dd9a5baa2318a9499fd7b0f63e')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
