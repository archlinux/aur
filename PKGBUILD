# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=ttfautohint-py
pkgname=python-$_pyname
pkgver=0.4.3.post1
pkgrel=2
pkgdesc='Python wrapper for ttfautohint, a free auto-hinter for TrueType fonts'
url="https://github.com/fonttools/$_pyname"
arch=(x86_64)
license=(MIT)
depends=(python)
makedepends=(python-pip)
_py=py2.py3
_wheel="${_pyname/-/_}-$pkgver-$_py-none-manylinux_2_5_$CARCH.manylinux1_$CARCH.manylinux_2_12_$CARCH.manylinux2010_$CARCH.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_pyname::1}/$_pyname/$_wheel")
sha256sums=('099127c38f5ccfbe42a58f2e4ac2efe5fd58e337f14c34af7417ce9d534c986e')

package() {
	export PIP_CONFIG_FILE=/dev/null
	pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
	python -O -m compileall "$pkgdir"
}
