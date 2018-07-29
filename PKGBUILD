# Maintainer: Danish Prakash <danishprakash at outlook dot com>
_gitrepository='goodreadsh'
_gitbranch='master'
pkgname='goodreadsh'
pkgver=1.0.1
pkgrel=1
pkgdesc='Command line interface for Goodreads'
arch=('i686' 'x86_64')
url='https://github.com/prakashdanish/goodreadsh'
license=('MIT')
depends=()
makedepends=('git')
provides=('goodreadsh')
source=("git+https://github.com/prakashdanish/${_gitrepository}.git#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitrepository}"
  printf '1.%s\n' "$(( $(git rev-list --count master) ))"
}

package() {
  cd "${srcdir}/${_gitrepository}"
  install -Dm755 './goodreads' "${pkgdir}/usr/bin/goodreads"
}
