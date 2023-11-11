# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=python-${_name}-bin
pkgver=0.19.13
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
source=("https://files.pythonhosted.org/packages/da/65/781919f655e0a8035dd1c67ee212c531e2946dd5bdd8e19715e14b98bf0d/polars-0.19.13-cp38-abi3-manylinux_2_28_x86_64.whl" "https://raw.githubusercontent.com/pola-rs/polars/py-0.19.13/LICENSE")
noextract=("polars-0.19.13-cp38-abi3-manylinux_2_28_x86_64.whl")
b2sums=("ddafbca31986aeb2e631ee37843980aa3c89ee3011d1bc4a0a355aa38368e5f433a824263ad1e30fd23f61ac0eb600705ed52462e34ce5f40215dd4bbaabfb1d" "beb89c6e59918ec3c2c8c5cb2011b7c98d01b44fb43c3bed76cd945368e5e179224aafef2b0946cb6717c9e0e3b97b76fea995d7419f4b8c53e8e7e3b9965a7b")

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
