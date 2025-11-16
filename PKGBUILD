# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.7.17
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
b2sums=('5f474bc365137dc014571db798fb8ea951f0715075e1ca70512f51c6ebecc35ac7f4f59eefaad74f256b1ffafdd405fe21302c85aa42d12bf2438fa52ae99bd1')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
