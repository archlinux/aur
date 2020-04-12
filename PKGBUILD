# Maintainer: gryffyn <aur@evan.mp>

pkgname=python2-libformatstr-git
_pkgname=libformatstr
pkgver=r26.71f9ac6
pkgrel=1
pkgdesc="Small script to simplify format string exploitation."
arch=('any')
url="https://github.com/hellman/libformatstr/"
license=("MIT")
depends=('python2')
makedepends=('git')
source=("${_pkgname}"::"git+https://github.com/hellman/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    python2 setup.py install --root ${pkgdir}
}
