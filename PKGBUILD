# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=python2-ctypesgen-git
_pkgname=ctypesgen
pkgver=r128.3d2d980
pkgrel=1
pkgdesc="A pure-python ctypes wrapper generator"
arch=('any')
url="https://github.com/davidjamesca/ctypesgen"
license=('BSD')
depends=('python2')
makedepends=('cmake' 'git')
source=("ctypesgen::git+https://github.com/davidjamesca/${_pkgname}.git")
conflicts=(python2-ctypesgen)
provides=(python2-ctypesgen)
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
	
  python2 setup.py install --root=${pkgdir}
}

