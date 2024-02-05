# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.20.7
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
source=("https://files.pythonhosted.org/packages/2a/b6/89628dbea4624ba0c0c4d960441645b4fa77f830ee3dbbe62bccf4cb0a87/polars-0.20.7-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-0.20.7/LICENSE")
noextract=("polars-0.20.7-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("828074f0cd4aa62527add77e3c6b56ea8e41a69e6d0ed21b1970d0a606ce17bad9951843f4796bf39e1748c04a6570f01f322f219baafe69df5b7d79da5fc8fa" "beb89c6e59918ec3c2c8c5cb2011b7c98d01b44fb43c3bed76cd945368e5e179224aafef2b0946cb6717c9e0e3b97b76fea995d7419f4b8c53e8e7e3b9965a7b")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
