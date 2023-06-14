# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=ipp-include
pkgname=python-$_pkgname
pkgver=2021.8.0
pkgrel=1
pkgdesc="Intel® Integrated Performance Primitives"
arch=(x86_64)
url=https://www.intel.com/content/www/us/en/developer/tools/oneapi/ipp.html
makedepends=(python-installer)
license=(custom)
_py=py2.py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-manylinux1_$arch.whl")
sha256sums=('d0da94b162043fd28f66b0e100b5958671957ea506623d43e05ba255f2b31489')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
