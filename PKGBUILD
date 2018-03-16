# Maintainer: Andrei Pavel <andrei.pavel@cti.pub.ro>
_gitrepository='curate-pkg'
_gitbranch='master'
pkgname='curate-pkg-git'
pkgver=r42.7182b4f
pkgrel=1
pkgdesc='curate-pkg: that script you craved for to keep a consistent image of installed packages across **ALL** package managers'
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

