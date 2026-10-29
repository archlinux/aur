# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.7.30
pkgrel=2
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
b2sums=('e7442c26ca2c700cd4ff81a5b27e7ab09ae5915a586a9e3b799d0fc963b184b4b11d6f98dcccfd75daf3e86401af8edca604e97c74310e9e8a0ab33285803f05')
options=("!strip")

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
