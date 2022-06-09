# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.13.44
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
license=('MIT')
depends=('python' 'python-numpy')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyarrow: for interoperability with arrow types'
            'python-pytz: to enable conversion to python datetimes with timezones'
            'python-fsspec: to transparently open files locally or remotely')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/9c/db/67a77d066225907f0cd50887cb614d6be2e274c99aca3588bd355e15bc31/polars-0.13.44-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
noextract=("polars-0.13.44-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
sha512sums=("6b88ce1b91bce652d7bf5ec4df125e19b8bc597ab22f84c3d199dfd4380699af03fba4399bc4d85212712f481a9dabf1b95f4718dfc4a19950ed91e3189e332f")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    # TODO: Find a license somewhere?
    # install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name-$pkgver/LICENSE
}
