# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Erdbeerkaese
# Contributor: Arkham <arkham at archlinux dot us>

_pkgname=slingshot
pkgname=${_pkgname}-python3
epoch=1
pkgver=0.9+5+g243aef9
pkgrel=1
pkgdesc="A 2D strategy game in the gravity fields of several planets (python3 port)"
arch=('any')
url="https://github.com/indritbashkimi/slingshot"
license=('GPL')
depends=('python-pygame' 'python-docopt')
makedepends=('python-distutils-extra' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("${_pkgname}::git+https://github.com/indritbashkimi/slingshot.git#branch=python3")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed "s/-/+/g"
}

package() {
  cd "${_pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}
