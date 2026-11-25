# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.8.0
pkgrel=1
pkgdesc="Python Extract Transform and Load Tables of Data"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('MIT')
depends=("python")
# upstream extras, none required
optdepends=("python-fastavro: avro files"
            "python-bcolz: bcolz ctables"
            "python-sqlalchemy: databases"
            "python-pytables: HDF5 files"
            "python-numexpr: HDF5 files"
            "cython: HDF5 files"
            "python-numpy: numpy arrays"
            "python-pandas: pandas dataframes"
            "python-aiohttp: HTTP sources"
            "python-requests: HTTP sources"
            "python-intervaltree: interval joins"
            "python-fsspec: remote sources"
            "python-smbprotocol: SMB sources"
            "python-whoosh: whoosh indexes"
            "python-xlrd: xls files"
            "python-xlwt: xls files"
            "python-openpyxl: xlsx files"
            "python-lxml: XPath")
makedepends=("python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('57a0a7fac742a7dbbecf6d3080a8634bb518a99a77f3aa80acdcc08bae4b3c7d7327d22bf321a3238001bb55e6ce719118eebd40645600dac4228474a760bcb6')
options=("!strip")

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
