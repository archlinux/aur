# Maintainer: getzze <getzze [at] @gmail [dot] com>
# Maintainer: Maziar Saleh Ziabari
# Contributor: Phil A. <flying-sheep@web.de>

pkgname=jupyter_highlight_selected_word
pkgver=0.2.0
pkgrel=3
pkgdesc='Jupyter notebook extension that enables highlighting every instance of the current word in the notebook'
arch=(any)
url="https://github.com/jcb91/$pkgname"
license=(BSD)
depends=(python jupyter-notebook)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("$_wheel::https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('9545dfa9cb057eebe3a5795604dcd3a5294ea18637e553f61a0b67c1b5903c58')

noextract=("$_wheel")

package() {
	local site="${pkgdir}/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	cd "${site}"
	bsdtar xvf "${srcdir}/$_wheel"
}
