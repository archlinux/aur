# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=ipp
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
sha256sums=('9cfa52dde8859a1d0858e47cb325e545639ff008a32bf76d79adbfe7916bb05a')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
