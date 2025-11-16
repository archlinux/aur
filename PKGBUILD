# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.17.2
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
b2sums=('9f1b8e1cf7d055fc2c3cf1f9efa5d24c4ea9bc9802530f4e9652844a16ed32f4200b054455ca00c74269a17af16a1bf4713be386b87d535ed563be35ab2991a4')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
