# Maintainer: Andrei Pavel <andrei.pavel@cti.pub.ro>
_gitrepository='curate-pkg'
_gitbranch='master'
pkgname='curate-pkg-git'
pkgver=r59.80e3e99
pkgrel=1
pkgdesc='curate-pkg: script to keep a consistent state of installed packages across **ALL** package managers'
arch=('i686' 'x86_64')
url='https://github.com/andrei-pavel/curate-pkg'
license=('MIT')
depends=('unp' 'yq')
makedepends=('git')
provides=('curate-pkg')
source=("git+https://github.com/andrei-pavel/${_gitrepository}.git#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitrepository}"
  printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitrepository}"
  ./install -p "${pkgdir}"
}

