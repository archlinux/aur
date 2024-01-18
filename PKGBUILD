# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.20.5
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
source=("https://files.pythonhosted.org/packages/94/53/3a039c9d564c676464ca1aa66ff41bc635cf79fbf2c4a6efdd007038e5f7/polars-0.20.5-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-0.20.5/LICENSE")
noextract=("polars-0.20.5-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("923a43617592fda1c461c14f6aacf66e38112e10ad8ff485896918b52c79172b490eb8da45e284ba786f161864c8cabd460950a983938f3dd8cd82ac1791a214" "beb89c6e59918ec3c2c8c5cb2011b7c98d01b44fb43c3bed76cd945368e5e179224aafef2b0946cb6717c9e0e3b97b76fea995d7419f4b8c53e8e7e3b9965a7b")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
