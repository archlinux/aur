# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.16.0
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
b2sums=('dad6091dcd9f52e9238256d6a21ecd47840bd4eae818c202729a30422e422accd2b3b07aa56a3da4831f4677acb23d02113371871f14a56cb86efadc2a84ffe3')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
