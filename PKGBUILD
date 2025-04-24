# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-fastdatatable"
_name="${pkgname#python-}"
pkgver=0.12.0
pkgrel=1
pkgdesc="A performance-focused reimplementation of Textual's DataTable widget, with a pluggable data storage backend"
arch=("any")
license=("MIT")
url="https://github.com/tconbeer/textual-fastdatatable"
depends=("python"
         "python-pandas-stubs"
         "python-pyarrow"
         "python-pytz"
         "python-textual")
makedepends=("python-build" "python-installer" "python-poetry" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name/-/_}-${pkgver}.tar.gz")
b2sums=('ce0e9e382653cf041c2e1234ccac78d880c29bbe61172703c973e071c9b9fe883f9caa003f7aa93ba2cf86d69e969719b9a892b0d12727dd2a57fa1888d708bf')

build(){
 cd "textual_fastdatatable-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "textual_fastdatatable-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
