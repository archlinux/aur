# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.13.53
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
source=("https://files.pythonhosted.org/packages/a4/bc/0e7bf12b341aaa296308727a0de7ea0d04056c5079164bc4c37135f8277b/polars-0.13.53-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE")
noextract=("polars-0.13.53-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
b2sums=("09d3d9b6616f3f08aeaf09ff735242a8e81dde7128042ed0a19eefaa88b9aa893c9ba02bd898b3b2b16659cfb94bc765c6ec19d7b4ead35f6ec7edc24315c157" "f6a50e749403e3b9b114db61efe141304953674ca8f202a8848c8df4321a18ecebc34529a4bb319eb1e9092763f7073f52d05635b5ed90e7839e5eb987bd2161")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
