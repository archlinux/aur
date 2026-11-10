# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-petl"
_name="petl"
pkgver=1.7.32
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
b2sums=('52376b8c6a04ed14d00c6d0618c1acfedbd422d3631f34e088c53abad7d79d944015af05db308d252464dc64b78d88de650362a280b89817dcd7d1e5b20f94bc')
options=("!strip")

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
