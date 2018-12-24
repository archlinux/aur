# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=sphinx-autodoc-typehints
pkgname=python-$_pkgname
pkgver=1.6.0
pkgrel=1
pkgdesc="Type hints support for the Sphinx autodoc extension"
arch=('any')
url="https://github.com/agronholm/sphinx-autodoc-typehints"
license=('MIT')
depends=('python-sphinx')
optdepends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f9c06acfec80766fe8f542a6d6a042e751fcf6ce2e2711a7dc00d8b6daf8aa36')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
