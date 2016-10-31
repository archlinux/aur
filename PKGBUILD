# Maintainer: Arthur Țițeică / arthur dot titeica with gmail

_pkgname="morty"
pkgname="morty-git"
pkgver=r21.cb702c9
pkgrel=1
pkgdesc="Web content sanitizer proxy as a service"
arch=('i686' 'x86_64')
url="https://github.com/asciimoo/morty"
license=('AGPL3')
provides=('morty')
makedepends=('go' 'git')
source=("git+https://github.com/asciimoo/morty.git")
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  GOPATH=${srcdir}/${_pkgname} go get -v -x github.com/asciimoo/morty
}

package() {
  cd ${srcdir}/${_pkgname}
  install -D bin/morty "${pkgdir}/usr/bin/morty"
}

# vim:set ts=2 sw=2 et:

