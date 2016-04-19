# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=python-amoeba
pkgname=("python-amoeba" "python2-amoeba")
pkgver=1.2
pkgrel=2
pkgdesc="Amoeba fit routine based on the method of Nelder and Meads"
url="https://stitchpanorama.sourceforge.net/Python/amoeba.py"
arch=('any')
license=('GPL2')
makedepends=("python" "python2")
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

package_python2-amoeba() {
    depends=('python2')
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}

package_python-amoeba() {
    depends=('python')
    python setup.py install --root="${pkgdir}/" --optimize=1
}
