# Maintainer: Ivan Shapovalov <intelfx@intelfx.name
# Contributor: Javier Tiá <javier.tia at gmail dot com>
# Contributors: Javier Vazquez <j.e.vasquez.v at gmail dot com>
# Contributors: Nagy Gábor <ngm.hun at gmail dot com>

pkgname=gdrivefs-git
_gitname=GDriveFS
pkgver=0.14.12.r17.ge6d9028
pkgrel=1
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
source=("git://github.com/dsoprea/${_gitname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd "${_gitname}"
  python2 setup.py build
}

package() {
  cd "${_gitname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ft=sh ts=2 sw=2 et:
