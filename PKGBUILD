# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.13.47
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
source=("https://files.pythonhosted.org/packages/1a/60/be57c0d462a757d2e7aa85f5fa7ecdf41ed660ee6e788d825f5dd939a3b6/polars-0.13.47-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE")
noextract=("polars-0.13.47-cp37-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
sha512sums=("679fbab92bd962e796d064ca89ac7017d0051de6ebe7695959ac8c90eaa0af712aa3f769e819f4664d28f6f6a2127f048c038dfeac4bbbfe7b9e9b6d311ac587" "da04b728c26b24f96f8f0216dc85697af954630514113784577902154cd008744163e6691f278de3fecb423ca313cbc8db633f42dc29c94c37ca0960524a6f76")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
