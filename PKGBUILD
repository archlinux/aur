# Maintainer: Ivan Shapovalov <intelfx100@gmail.com
# Contributor: Javier Tia <javier.tia at gmail dot com>

pkgname=gdrivefs-git
_gitname=GDriveFS
pkgver=0.14.3.r3.gdd54b7b
pkgrel=1
pkgdesc="A complete FUSE adapter for Google Drive."
url="https://github.com/dsoprea/GDriveFS"
depends=('python2' 'python2-fusepy' 'python2-gevent' 'python2-google-api-python-client' 'python2-greenlet' 'python2-httplib2' 'python2-dateutil' 'python2-six' 'python2-wsgiref')
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
