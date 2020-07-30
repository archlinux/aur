# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=python-auditok-git
_pkgname=${pkgname%-git}
_gitname=auditok
pkgver=v0.1.8.r274.g271fd15
pkgrel=1
pkgdesc="An audio/acoustic activity detection and audio segmentation tool."
arch=('x86_64' 'i686')
url="https://github.com/amsehili/auditok"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}" )
source=("git+https://github.com/amsehili/auditok")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_gitname

  python setup.py build
}

package() {
  cd $_gitname

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: set sw=2 ts=2 et:
