# Maintainer: ferreum <code at ferreum dot de>
pkgname=mved
pkgver=0.7.3
pkgrel=3
pkgdesc="Bulk-move, copy and delete files safely using a text editor"
arch=('any')
url="https://gitlab.com/ferreum/mved"
license=('GPL3')
depends=('python' 'python-simplediff')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/m/mved/mved-${pkgver}.tar.gz")
sha256sums=(990056ea02556f1cafffba73a144788e84b65befb14258975512d821ea31942b)

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
