# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=ttfautohint-py
pkgname=python-$_pyname
pkgver=0.6.1
pkgrel=1
pkgdesc='Python wrapper for ttfautohint, a free auto-hinter for TrueType fonts'
url="https://github.com/fonttools/$_pyname"
arch=(x86_64)
license=(MIT)
depends=(python python-setuptools)
makedepends=(python-installer)
_py=py3
_wheel="${_pyname/-/_}-$pkgver-$_py-none-manylinux2014_$CARCH.manylinux_2_17_$CARCH.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_pyname::1}/$_pyname/$_wheel")
sha256sums=('90250631e8646c96a01fdae1736191b021811e41923a7b8259b07690466b7e7d')

package() {
	python -m installer --destdir="$pkgdir" $_wheel
	python -O -m compileall "$pkgdir"
}
