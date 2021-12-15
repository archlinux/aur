# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=2.1.0
pkgrel=1
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
depends=(python
         python-gitpython
         python-fonttools)
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tgz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c8f36e1413a94cd58f64e519681be12e019d78dd9a5baa2318a9499fd7b0f63e')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
