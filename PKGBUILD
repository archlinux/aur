# Maintainer: ferreum <code at ferreum dot de>
pkgname=mved
pkgver=0.6.1
pkgrel=1
pkgdesc="Bulk-move, copy and delete files safely using a text editor"
arch=('any')
url="https://gitlab.com/ferreum/mved"
license=('GPL3')
depends=('python' 'python-simplediff')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/m/mved/mved-${pkgver}.tar.gz")
sha256sums=(7028da329536116f7a22c4cfcb1b63f6cb7db2f25c508d49e2a35450d032460d)

build() {
    cd "mved-${pkgver}"

    python setup.py build
}

package() {
    cd "mved-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mved/LICENSE"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mved/README.rst"
}
