# Maintainer: ferreum <code at ferreum dot de>
pkgname=mved
pkgver=0.5.0
pkgrel=1
pkgdesc="Batch-move, copy and delete files safely using a text editor"
arch=('any')
url="https://gitlab.com/ferreum/mved"
license=('GPL3')
depends=('python' 'python-simplediff')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/m/mved/mved-${pkgver}.tar.gz")
sha256sums=(bbecfe0e1478f5a72ae9fc3bff18bb41b12f3c4503bf7053599c1d8e1440fda6)

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
