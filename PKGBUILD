# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.7.14
pkgrel=3
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
b2sums=('e50127a05082250db5a1f003ab124487738eea259721f639df557b56452d755088da518b739b1f22d3e8c204994354e262b47753f1cb3526134ee01464b7cad7')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
