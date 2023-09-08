# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.19.2
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
license=('MIT')
depends=('python' 'python-numpy')
conflicts=('python-polars')
provides=('python-polars')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyarrow: for interoperability with arrow types'
            'python-pytz: to enable conversion to python datetimes with timezones'
            'python-fsspec: to transparently open files locally or remotely')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/c4/f8/0e994906e613f71461a9e85f77c20417dd14dae9e8fed677385627edae5f/polars-0.19.2-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-0.18.13/LICENSE")
noextract=("polars-0.19.2-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("6d55456ae92c17df86217921c2524d8f82b167c76c99e50707a12bf6f7b8b984351e17181aacbfe813a011cee0694a66e1f3dce94585723133f6870fe4bd2dff" "f6a50e749403e3b9b114db61efe141304953674ca8f202a8848c8df4321a18ecebc34529a4bb319eb1e9092763f7073f52d05635b5ed90e7839e5eb987bd2161")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
