# Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_pkgname=wn
pkgver=0.0.23
pkgrel=2
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/alvations/wordnet'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/bc/f6/72db36e8afc977ae1a1cbb22afc77fd9b514e9bc6927ae8f4aae36665961/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('eee5b09a346600d2e33d6e69113a530283bbb422f04f9af6b277f2ca4ad514bd')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

