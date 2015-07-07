# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=restview
pkgver=2.4.0
pkgrel=1
pkgdesc="A viewer for ReStructuredText documents that renders them on the fly."
arch=(any)
url="http://mg.pov.lt/restview/"
license=('GPL')
depends=('python-docutils' 'python-pygments' 'python-readme')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/r/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('52eed1a9ce2bc31d6b4269c8c4ba8c5c1cf7c989b465e9a62bfa6357fc0da965')


package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}"/ --optimize=1
}

