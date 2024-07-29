# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=1.3.0
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
source=("https://files.pythonhosted.org/packages/e3/b3/f32a2f3e2881e45878c9f1fe18ea63d1208631b998965fb84c81b0e8824c/polars-1.3.0-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-1.3.0/LICENSE")
noextract=("polars-1.3.0-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("a53b5a5c8e8340600151b1f70e14437675e629baf1431896c086af9cc1e5d6b14230400f01521d3b9df83c672b8c4e9120d5962a61da7b4eabdfeb06cf9c4ec9" "74c712ca4ce1f3b35b33e76a681fb9f8411857f127a556a1d1d4ff17010b6a7d43c4b8c49f3cccd97daf6bbb7ffb294852e2b0fe40647927243fb542a64848ac")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
