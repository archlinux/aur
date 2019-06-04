# Maintainer: aereaux <aidan@jmad.org>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-cornice-0.16.2
_pkgname=cornice
pkgver=0.16.2
pkgrel=2
pkgdesc="Define Web Services in Pyramid"
arch=('any')
url="https://github.com/mozilla-services/cornice"
license=('MPL2')
depends=('python2')
makedepends=('python2-setuptools')
conflicts=('python2-cornice')
source=("https://github.com/Cornices/cornice/archive/${pkgver}.tar.gz")
sha512sums=("d28910c65fe90462832e05f92ed0d665cb3fbc4c6167ad0703d758a2b3bc75b8d3481a06d3217bde4a093c9b20a6aadcacb2a9e45cfd2f29b9ebe5e3ac87f4a2")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

