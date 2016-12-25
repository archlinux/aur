# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=python-tabulate
pkgver=0.7.7
pkgrel=1
pkgdesc="Pretty-print tabular data in Python"
arch=("any")
license=("MIT")
url="https://bitbucket.org/astanin/python-tabulate"
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/1c/a1/3367581782ce79b727954f7aa5d29e6a439dc2490a9ac0e7ea0a7115435d/tabulate-${pkgver}.tar.gz")
sha512sums=('36ea77577e36fad28efa9b1c10686a4a795acdea77be4f8b442b38f45d70993245b4b473b0ce146f3d24eb49f186ec47ada332a9a3973ac2786d5a46b7358213')

build() {
    cd "tabulate-${pkgver}"
    python setup.py build
}

package() {
    cd "tabulate-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
