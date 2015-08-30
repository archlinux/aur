# Maintainer: Gulshan Singh <gsingh2011@gmail.com>
pkgname=git-number-git
pkgver=1.0.0a.r9.gd684344
pkgrel=1
pkgdesc="A script to allow a user to perform git commands on files by referencing the files by numbers instead of names"
arch=('i686' 'x86_64')
url="https://github.com/holygeek/git-number"
license=('unknown')
makedepends=('git')
depends=('perl')
source=('git+https://github.com/holygeek/git-number.git')
md5sums=('SKIP')

_gitname="git-number"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/$_gitname"
  make test
}

package() {
  cd "$srcdir/$_gitname"
  make install prefix="$pkgdir/usr"
}
