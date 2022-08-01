# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.13.59
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
source=("https://files.pythonhosted.org/packages/a2/1b/68b6a3be39ea4a813c029a683f0b01d316e2b146c8ebeb45c77760592d63/polars-0.13.59-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE")
noextract=("polars-0.13.59-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
b2sums=("9c7a606e21e22c5b96cce772e5cb60d8c9527d29a54c648fe4edc27f8cf2ead00efc250f7320a7617bb874d14ff719e86f812f1e3706467cb8e4c78a01e7875a" "f6a50e749403e3b9b114db61efe141304953674ca8f202a8848c8df4321a18ecebc34529a4bb319eb1e9092763f7073f52d05635b5ed90e7839e5eb987bd2161")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
