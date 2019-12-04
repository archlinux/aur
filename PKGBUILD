# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=restview
pkgver=2.9.2
pkgrel=1
pkgdesc="A viewer for ReStructuredText documents that renders them on the fly."
arch=(any)
url="http://mg.pov.lt/restview/"
license=('GPL')
depends=('python-docutils' 'python-pygments' 'python-readme-renderer' 'python-setuptools')
options=(!emptydirs)
source=(
    "https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('790097eb587c0465126dde73ca06c7a22c5007ce1be4a1de449a13c0767b32dc')


build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py install --skip-build --root="${pkgdir}"/ --optimize=1
}

