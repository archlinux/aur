# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_pkgname=libgeneral
pkgname=$_pkgname-git
pkgver=83.r0.g2c3cce0
pkgrel=1
pkgdesc='Common library for tihmstar tools - git version'
arch=('x86_64')
url="https://github.com/tihmstar/$_pkgname"
license=('LGPL-2.1-only')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
