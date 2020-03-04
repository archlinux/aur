# Maintainer: Ivan Shapovalov <intelfx@intelfx.name
# Contributor: Javier Tiá <javier.tia at gmail dot com>
# Contributors: Javier Vazquez <j.e.vasquez.v at gmail dot com>
# Contributors: Nagy Gábor <ngm.hun at gmail dot com>

pkgname=gdrivefs-git
_gitname=GDriveFS
pkgver=0.14.12.r21.gc504de1
pkgrel=1
pkgdesc='A complete FUSE adapter for Google Drive'
url='https://github.com/dsoprea/GDriveFS'
depends=(
  'python'
  'python-google-api-python-client'
  'python-six'
  'python-fusepy'
  'python-greenlet'
  'python-httplib2'
  'python-dateutil'
  'python-oauth2client'
)
makedepends=(
  'python-setuptools'
)
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
  python setup.py build
}

package() {
  cd "${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ft=sh ts=2 sw=2 et:
