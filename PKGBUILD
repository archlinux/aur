# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.7.15
pkgrel=1
pkgdesc="Python Extract Transform and Load Tables of Data"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('MIT')
depends=(
        "python-fastavro"
        "python-bcolz"
        "python-sqlalchemy"
        "cython"
        "python-numpy"
        "python-numexpr"
        "python-aiohttp"
        "python-requests"
        "python-intervaltree"
        "python-numpy"
        "python-pandas"
        "python-fsspec"
        "python-smbprotocol"
        "python-xlrd"
        "python-xlwt"
        "python-openpyxl"
        "python-pytables"
        "python-lxml"
        "python-whoosh"
)
makedepends=("python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('df716ed1d2048ac66b42ef015149a888218812dd356b17f31e9068519379ad03fb23dd44a79d61e1a7dc962ee969016d963e862123c21e68988302af2f5e83c1')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
