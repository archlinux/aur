# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.7.14
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
        "python-tables"
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
        "python-lxml"
        "python-whoosh"
)
makedepends=("python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d4802e3c4804bf85f2267a0102fcad35c61e6a37c90d9e1a1674331f35a90a7f')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
