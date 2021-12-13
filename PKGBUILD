# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=2.0.0
pkgrel=2
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
depends=(python
         python-gitpython
         python-fonttools)
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1232d97e9d72c5af78e3341d5c6aa33bcf027d710cbac9b33bbfa866d0b41a6d')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
