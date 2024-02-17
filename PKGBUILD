# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.11.3
pkgrel=1
pkgdesc="A text area (multi-line input) with syntax highlighting for Textual"
url="https://pypi.org/project/textual-textarea/"
license=("MIT")
arch=("any")
depends=("python"
         "python-textual"
         "python-pyperclip"
        )
makedepends=("python-build"
             "python-installer"
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('342832e4eb178c9f952318ca381488d841e53e2fe74da960fb7ceacbf881149aae4a7a10f993cbbd95ec52cd139d7994481b82c3f42bd1b51892c3abc8ef9daa')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
