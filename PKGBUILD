# Contributor: Lex Black <autumn-wind@web.de>

_module="MarkupPy"
pkgname="python-markuppy"
pkgver=1.14
pkgrel=1
pkgdesc="HTML/XML generator"
arch=("any")
url="https://tylerbakke.github.io/MarkupPy/"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
sha256sums=('1adee2c0a542af378fe84548ff6f6b0168f3cb7f426b46961038a2bcfaad0d5f')


build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
