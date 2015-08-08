# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Trustin Lee <t@motd.kr>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=trash-cli-git
_pkgname=trash-cli
pkgver=413.7913a0b
pkgrel=1
pkgdesc='Command line trashcan (recycle bin) interface'
arch=('any')
url="http://github.com/andreafrancia/${_pkgname}"
license=('GPL')
depends=('python2' 'python2-distribute')
makedepends=('git')
provides=('trash-cli')
conflicts=('trash-cli')
source=("git+http://github.com/andreafrancia/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python2 setup.py build
}

package(){
  cd "${_pkgname}"
  python2 setup.py install --root="${pkgdir}"
}

