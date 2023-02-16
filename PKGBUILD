# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.16.6
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
source=("https://files.pythonhosted.org/packages/68/e4/6f9eb1f07a08888a1f400f5b3374170ee92552e6d3d4488ed4783b8c3c7c/polars-0.16.6-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE")
noextract=("polars-0.16.6-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("a150f00f113db929e942f113f9062510bfeb01fd3e24e87cf34c5222ab3862c6b431c1f537c5c4d7e543c710d65ad9d7dab8fa0d3b64014def128b2e6f3924d2" "f6a50e749403e3b9b114db61efe141304953674ca8f202a8848c8df4321a18ecebc34529a4bb319eb1e9092763f7073f52d05635b5ed90e7839e5eb987bd2161")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
