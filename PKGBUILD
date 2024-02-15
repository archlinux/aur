# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-textual-fastdatatable"
_name="${pkgname#python-}"
pkgver=0.7.1
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
b2sums=('700a1b6f7909d6737a48fbd02ea185289cf9abdde6dded3a27b83d1056af6359567b6c717263d6f145a2f8866c0ccbbf5dea79c5e7d9d976801b020f8f597e60')

build(){
 cd "textual_fastdatatable-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "textual_fastdatatable-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
