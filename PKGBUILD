# Maintainer: Cillian Berragan <cjberragan@gmail.com>
# Python package author: Stanford NLP
pkgname=python-stanza
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python NLP Library for Many Human Languages"
arch=("x86_64")
url="https://stanfordnlp.github.io/stanza/"
license=("Apache")
depends=(
        "python-numpy"
        "python-protobuf"
        "python-requests"
        "python-pytorch"
        "python-tqdm"
)
makedepends=("python-wheel")
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('7549cd62e92b27000ab6ecf2ef63c2ca')

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
