# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.18.3
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
source=("https://files.pythonhosted.org/packages/e7/91/28eb13bd51394e7c92b23cad394a89565109b2332ecd3ce6477e7f681bbf/polars-0.18.3-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE")
noextract=("polars-0.18.3-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("920acb9bf05a8ba0abf6e597e1a729635aad32cec047185e632998881677d6d573f1495743150a38b7ff3a5576e2e720665636d907dbc68ac006a31f7564c853" "f6a50e749403e3b9b114db61efe141304953674ca8f202a8848c8df4321a18ecebc34529a4bb319eb1e9092763f7073f52d05635b5ed90e7839e5eb987bd2161")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
