# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.20.13
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
source=("https://files.pythonhosted.org/packages/61/84/888d1c8da221917bb3ec72adea5aa0ae0523a07ff6b1473be3a9c2e283df/polars-0.20.13-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-0.20.13/LICENSE")
noextract=("polars-0.20.13-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("0f285614ccd5e6083e0185cc0a93ace4c20038d04551acffdf139cf3e0689da7bc6acaa8ef0b9333ceac970da393762f840fed1939821e371be34611106328aa" "beb89c6e59918ec3c2c8c5cb2011b7c98d01b44fb43c3bed76cd945368e5e179224aafef2b0946cb6717c9e0e3b97b76fea995d7419f4b8c53e8e7e3b9965a7b")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
