# Maintainer: peippo <christoph.fink@gmail.com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-syncstorage
_pkgname=server-syncstorage
pkgdesc="The SyncServer server software, as used by Firefox Sync"
url="https://github.com/mozilla-services/server-syncstorage"

pkgver=1.6.14
pkgrel=1

license=('MPL2')
arch=('any')

depends=("python2")
makedepends=("python2-setuptools")

source=("https://github.com/mozilla-services/server-syncstorage/archive/${pkgver}.tar.gz")
sha512sums=("SKIP")

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

