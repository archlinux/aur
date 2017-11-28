# Maintainer: j605

_gitname=duviz
pkgname=$_gitname-git
pkgver=r48.3ae1f98
pkgrel=1
pkgdesc='Command line disk space usage visualization utility'
arch=('any')
url="http://soxofaan.github.com/duviz/"
license=('GPL')
depends=('python')
makedepends=('git')
source=('git+https://github.com/soxofaan/duviz.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  sed -i -e '1s:#!/usr/bin/env python:#!/usr/bin/python:' duviz.py
}
package() {
  cd "$_gitname"
  install -Dm 755 duviz.py ${pkgdir}/usr/bin/duviz
}
