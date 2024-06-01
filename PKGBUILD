# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.20.31
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
source=("https://files.pythonhosted.org/packages/90/7d/7541e559d7fce232ba34340b0953cac9af2344853d675dc2de01a4d3abc7/polars-0.20.31-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-0.20.31/LICENSE")
noextract=("polars-0.20.31-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("245e05ac7edb012cc40474560d50b27d31e035fba4e1917db38855c8b5d947cf62db52c3562cd297fde19eaa2e02837d33d2ac1f5ca6a51f92ca92c4ac149918" "74c712ca4ce1f3b35b33e76a681fb9f8411857f127a556a1d1d4ff17010b6a7d43c4b8c49f3cccd97daf6bbb7ffb294852e2b0fe40647927243fb542a64848ac")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
