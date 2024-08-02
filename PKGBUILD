# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=1.4.0
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
source=("https://files.pythonhosted.org/packages/58/94/528e49b0b9e55218ca096d016f80df6ca531ea482fd512eb102851ec2677/polars-1.4.0-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-1.4.0/LICENSE")
noextract=("polars-1.4.0-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("8136a9947a88e92e33191116f1402c75640fd10941f26f09a1367ec03c985e2e363e0d96c8ecabc870f3f63a7f1f0ff54962450856da0c584617d3392a563fcc" "74c712ca4ce1f3b35b33e76a681fb9f8411857f127a556a1d1d4ff17010b6a7d43c4b8c49f3cccd97daf6bbb7ffb294852e2b0fe40647927243fb542a64848ac")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
