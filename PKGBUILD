# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=1.7.1
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
source=("https://files.pythonhosted.org/packages/d5/f4/8cd6d454fcf6e1f5f0a17265a3acca19731f79c65c7432bafbb24492bf73/polars-1.7.1-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-1.7.1/LICENSE")
noextract=("polars-1.7.1-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("6213aeb8c5a9522dff6649937c90cfb5282d8de9c1f84b16d8ce48ba248ec0ba783ec96cde1e29cde3ed6e74b0a505e8913147255b3460ed26cb42bdcf65a42a" "74c712ca4ce1f3b35b33e76a681fb9f8411857f127a556a1d1d4ff17010b6a7d43c4b8c49f3cccd97daf6bbb7ffb294852e2b0fe40647927243fb542a64848ac")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
