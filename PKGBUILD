# Maintainer: Javier Tiá <javier.tia at gmail dot com>
# Contributors: Javier Vazquez <j.e.vasquez.v at gmail dot com>
# Contributors: Nagy Gábor <ngm.hun at gmail dot com>

pkgname=gdrivefs
_gitname=GDriveFS
pkgver=0.14.9
pkgrel=4
pkgdesc='A complete FUSE adapter for Google Drive'
url='https://github.com/dsoprea/GDriveFS'
depends=(
  'python2'
  'python2-dateutil'
  'python2-fusepy'
  'python2-gevent'
  'python2-google-api-python-client'
  'python2-greenlet'
  'python2-httplib2'
  'python2-oauth2client'
  'python2-six'
  'python2-wsgiref'
)
makedepends=('python2-distribute')
license=('GPL2')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('eacc6633716823d93ca4a3ac5e1aaeeaa49513051136d6f8df681667cbc882d5')

build() {
  cd ${srcdir}/${_gitname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ft=sh ts=2 sw=2 et:
