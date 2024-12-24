# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pybrowserstack-screenshots
_pkgname=pybrowserstack-screenshots
pkgver=0.1
pkgrel=5
pkgdesc='client and api wrapper for Browserstack Screenshots, including phantomCSS support'
arch=(any)
url="http://github.com/cmck/$_pkgname"
license=(MIT)
depends=(python
         python-pillow
         python-requests
         python-simplejson)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('530cba97ff4131ec9cf003bf7b63fa48d7dd81a2e63bb75dbbd771f1f19f7c9a')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
