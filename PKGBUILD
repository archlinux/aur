# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.13.49
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
source=("https://files.pythonhosted.org/packages/7d/53/6af455e14341d1302b5a530259a97b512b40203b67d03dbfd0a9b69b25bb/polars-0.13.49-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE")
noextract=("polars-0.13.49-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
sha512sums=("03ebd684a89ff0c5bac714e5e683b04badc5c94e2f38167600116f2841b34f9ee860c5e1e0c1228c9864247f327c0bf52ac1d5132821f338ca1c43bb4fdf0152" "da04b728c26b24f96f8f0216dc85697af954630514113784577902154cd008744163e6691f278de3fecb423ca313cbc8db633f42dc29c94c37ca0960524a6f76")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
