# Maintainer: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-cornice
_pkgname=cornice
pkgdesc="Define Web Services in Pyramid"
url="https://github.com/mozilla-services/cornice"

pkgver=3.5.1
pkgrel=0

arch=("any")
license=("MPL2")

depends=("python2")
makedepends=("python2-setuptools")

source=("https://github.com/Cornices/cornice/archive/${pkgver}.tar.gz")
sha512sums=("4499158d73fe67d24dfd82861811b26bdca58410b7ee604072dffa54fb4b353cb886585115b62b08899e93668ad0a66e41b07cc58ed1c068d70332b87f30895a")

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

