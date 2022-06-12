# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.13.45
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
source=("https://files.pythonhosted.org/packages/41/f3/b877d4429f810951a55ce579d1ecbf4153c14a890fefd51c4ca53d14f345/polars-0.13.45-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
noextract=("polars-0.13.45-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
sha512sums=("77b2f7784862184f84c3b2bfb9707021cc5d06f6a906716e2079aa098e3ecb9d9004eeaef30247b5f2eb9cb299180b1d2758189a1a4e43c167dfdcccfd3b2947")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    # TODO: Find a license somewhere?
    # install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name-$pkgver/LICENSE
}
