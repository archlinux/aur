# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=1.5.0
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
source=("https://files.pythonhosted.org/packages/e4/a4/0eadfba75a12366af2f0554649aa69c319fb85111025d8583f0b21d0e0c0/polars-1.5.0-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-1.5.0/LICENSE")
noextract=("polars-1.5.0-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("0e9f2a583138bd133f8af811be2ff63fb33b191ebb7140a77f4071199c424aac74757a5ac63866e0552155bb38002e450bc6edf6c47411a0bc7e547e93400a9e" "74c712ca4ce1f3b35b33e76a681fb9f8411857f127a556a1d1d4ff17010b6a7d43c4b8c49f3cccd97daf6bbb7ffb294852e2b0fe40647927243fb542a64848ac")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
