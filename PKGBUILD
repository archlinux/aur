# Maintainer: ferreum <code at ferreum dot de>
pkgname=mved
pkgver=0.5.1
pkgrel=1
pkgdesc="Batch-move, copy and delete files safely using a text editor"
arch=('any')
url="https://gitlab.com/ferreum/mved"
license=('GPL3')
depends=('python' 'python-simplediff')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/m/mved/mved-${pkgver}.tar.gz")
sha256sums=(b5dcfbea8175b9b2977eec2f50547270529501b28a695572c944491fab597048)

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
