# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.19.8
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
source=("https://files.pythonhosted.org/packages/0b/01/e1d20fd57549c8924df72ca3723d37867737beeb0ab66a80d585d5aa750a/polars-0.19.8-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-0.19.8/LICENSE")
noextract=("polars-0.19.8-cp38-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=("df41dffaf1b572c355580b662f5ee95467714d50ea4148f7669c7dd2b9fe3e28c948f714c8314f8ecaa2c1a7c738e98202437ee9783ce4dd1134e162ee614b41" "beb89c6e59918ec3c2c8c5cb2011b7c98d01b44fb43c3bed76cd945368e5e179224aafef2b0946cb6717c9e0e3b97b76fea995d7419f4b8c53e8e7e3b9965a7b")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
