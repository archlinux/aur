# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_pkgname=wn
pkgver=0.0.19
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/alvations/wordnet'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/34/cc/45d03eb6defd1e96a3e35edd6032818f0318b2b4ff2f3cfffa3b675f1722/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('72f8259487a09d7716bce02cc4f1f1c79e9c102b5d2c4a0bc5e935e55ce71f59')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

