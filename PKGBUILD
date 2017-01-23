# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=autorlogin-git
_gitname=autorlogin
pkgver=1.d30d2d2
pkgrel=1
pkgdesc="A wrapper around rlogin to restart it upon connection loss"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git')
provides=('autorlogin')
conflicts=('autorlogin')
url="none"
source=("git+https://bitbucket.org/calcmogul/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
