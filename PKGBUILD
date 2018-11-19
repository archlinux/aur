# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=sphinx-autodoc-typehints
pkgname=python-$_pkgname
pkgver=1.5.0
pkgrel=1
pkgdesc="Type hints support for the Sphinx autodoc extension"
arch=('any')
url="https://github.com/agronholm/sphinx-autodoc-typehints"
license=('MIT')
depends=('python-sphinx')
optdepends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a635e98faf2b9f1169eba19104bd8d378e45da6f8936f6f774d9cc0640d4caee')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
