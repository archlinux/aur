# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.15.0
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
b2sums=('66a3332317d6bf814016510e84f4d72945e712cd8efffe8f8f0e140a6c1e2ed282f3c0ebf7e8020dd3ac4b121c2ed3fcb78a11e4cf79e339e38b7efe545b8014')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
