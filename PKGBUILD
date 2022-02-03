# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=restview
pkgver=3.0.0
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
sha256sums=('2b989610aaed2fd42da64f6cdc539cf3ee70ce370bcba872db72421ad515dd1e')


build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py install --skip-build --root="${pkgdir}"/ --optimize=1
}
