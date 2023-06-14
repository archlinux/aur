# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=ipp-devel
pkgname=python-$_pkgname
pkgver=2021.8.0
pkgrel=2
pkgdesc="Intel® Integrated Performance Primitives"
arch=(x86_64)
url=https://www.intel.com/content/www/us/en/developer/tools/oneapi/ipp.html
depends=(python-ipp python-ipp-include)
makedepends=(python-installer)
license=(custom)
_py=py2.py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-manylinux1_$arch.whl")
sha256sums=('ba9e1d873120e75d57a9a0c8bde8df6f62ca9f6893eb7e0a55b467affdd47046')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
