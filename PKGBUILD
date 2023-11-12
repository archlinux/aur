# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.7.3
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
b2sums=('f2a86a1470ded94018e17d828d9c658a08cd03e3699c7658ce0f3c6271783f179056a8cef9f7754a833f461854b4b5ef36718e0a823d998ef453993347bc527a')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
