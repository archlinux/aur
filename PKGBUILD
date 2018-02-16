pkgname=python2-odict
provides=('odict')
pkgver=1.6.2
pkgrel=1
pkgdesc="Ordered dictionary."
arch=('any')
url="https://github.com/bluedynamics/odict"
license=('PSF')
depends=('python2')
makedepends=('python2-distribute')
source=("https://github.com/bluedynamics/odict/archive/1.6.2.zip")
sha256sums=('87910e699e7f3cf736ddca1da9fad800ba4636e0de75b2072c2a03b8c4a42428')
 
build() {
   cd "${srcdir}/odict-${pkgver}"
   python2 setup.py build || exit 1
}
 
package() {
   cd "${srcdir}/odict-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
