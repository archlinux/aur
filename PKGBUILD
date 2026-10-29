# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.7.30
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
b2sums=('e7442c26ca2c700cd4ff81a5b27e7ab09ae5915a586a9e3b799d0fc963b184b4b11d6f98dcccfd75daf3e86401af8edca604e97c74310e9e8a0ab33285803f05')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
