# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=spydaap
pkgname=${_pkgname}-git
pkgver=r178+0af5ac4
pkgrel=3
pkgdesc="DAAP server"
arch=('i686' 'x86_64')
url="https://gitlab.com/egh/spydaap"
license=('GPL3')
depends=('python-mutagen' 'avahi')
makedepends=('python-setuptools' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://gitlab.com/egh/spydaap)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
