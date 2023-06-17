pkgname=python-amoeba
pkgver=1.2
pkgrel=2
pkgdesc="Amoeba fit routine based on the method of Nelder and Meads"
url="https://stitchpanorama.sourceforge.net/Python/amoeba.py"
arch=('any')
license=('GPL2')
depends=('python')
makedepends=("python")
source=("http://stitchpanorama.sourceforge.net/Python/amoeba.py"
        "deepcopy.patch"
        "setup.py")
md5sums=('7e6a9ad95d8639ec3d1da7c6db0928fb'
         'd741ffab04b35e88f6ca60c3987886ae'
         'c68322a7608767cc03012e62b3baa546')

prepare() {
    cd "$srcdir/.."
    # fix an error with initial simplex
    patch amoeba.py deepcopy.patch
}

package() {
    python setup.py install --root="${pkgdir}/" --optimize=1
}
