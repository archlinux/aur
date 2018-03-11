# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-syncstorage
_pkgname=server-syncstorage
pkgver=1.6.13
pkgrel=1
pkgdesc="The SyncServer server software, as used by Firefox Sync"
arch=('any')
url="https://github.com/mozilla-services/server-syncstorage"
license=('MPL2')
depends=('python2')
source=("https://github.com/mozilla-services/server-syncstorage/archive/${pkgver}.tar.gz")
sha512sums=("3994543a01feefeb2b5e9177e50887cadd347c20fa7bc67a890b98eb52e96f378a4b8224550f6929716e578cd014b0e6c9eb92240a1a86b3cf2dd177a9856739")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

