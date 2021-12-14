# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufodiff
pkgver=1.0.3
pkgrel=2
pkgdesc='UFO source file diff application'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
depends=(python
         python-commandlines
         python-gitdb
         python-gitpython
         python-smmap
         python-standardstreams)
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e549e7f3598c0cf0a6be207944fb632db0d834addb4cf202ee00967ceebd58dd')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
