# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=restview
pkgver=2.7.0
pkgrel=1
pkgdesc="A viewer for ReStructuredText documents that renders them on the fly."
arch=(any)
url="http://mg.pov.lt/restview/"
license=('GPL')
depends=('python-docutils' 'python-pygments' 'python-readme-renderer')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/mgedmin/restview/archive/${pkgver}.tar.gz")
sha256sums=('ab288234da5c6b3f7cd02d6112d0a020822f43423c086089efeeda2ffac5c388')


package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}"/ --optimize=1
}

