# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=restview
pkgver=2.6.1
pkgrel=1
pkgdesc="A viewer for ReStructuredText documents that renders them on the fly."
arch=(any)
url="http://mg.pov.lt/restview/"
license=('GPL')
depends=('python-docutils' 'python-pygments' 'python-readme')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/mgedmin/restview/archive/${pkgver}.tar.gz")
sha256sums=('797104c9b1732363afb1e944d8ee5ef27352a5d134c40aa50ff81a64f3029b0e')


package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}"/ --optimize=1
}

