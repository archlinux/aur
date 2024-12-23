# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufolint
pkgver=1.2.0
pkgrel=5
pkgdesc='UFO source file linter'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
_pydeps=(commandlines
         fonttools
         fs) # for fonttools[ufo]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('7fb1aeeca0c0038dc75e86688d5ee72b8fff34338676090cf6373405fe31abfc')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
