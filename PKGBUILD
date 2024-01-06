# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-fastdatatable"
_name="${pkgname#python-}"
pkgver=0.6.1
pkgrel=1
pkgdesc="A performance-focused reimplementation of Textual's DataTable widget, with a pluggable data storage backend"
arch=("any")
license=("MIT")
url="https://github.com/tconbeer/textual-fastdatatable"
depends=("python"
         "pandas-stubs"
         "python-pyarrow"
         "python-pytz"
         "python-textual")
makedepends=("python-build" "python-installer" "python-poetry" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name/-/_}-${pkgver}.tar.gz")
b2sums=('a95eedb662bf89caa79ad70d9a43a7f9598692a9651d4dca370da104238cd4b3f6272bcbb4bcddd1fe72eaf747aa9b1e188e37587767447d9cf826b220bf6327')

build(){
 cd "textual_fastdatatable-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "textual_fastdatatable-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
