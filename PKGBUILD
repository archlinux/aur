# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.13.46
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/12/1f/7183f7d9bac04768f8d356dda136eb1a4731b0f89d41a29a2a72a6a3a19c/polars-0.13.46-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE")
noextract=("polars-0.13.46-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
sha512sums=("b0fa9f33619028639b8f210a4ace059bb863f96f9b5496e60e027e631ed9598d2f2e19574fb458c3a5d0a74aedeee816e5e70b6d9c80669a36fac8917a300083"  "da04b728c26b24f96f8f0216dc85697af954630514113784577902154cd008744163e6691f278de3fecb423ca313cbc8db633f42dc29c94c37ca0960524a6f76")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
