# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=oclint-json-compilation-database-git
_pkgname=oclint-json-compilation-database
pkgver=v0.7.15.g5ea3389
pkgrel=1
pkgdesc="A helper program that filters information from compile_command.json and
invoke OCLint for static code analysis "
arch=('i686' 'x86_64')
url="http://oclint.org/docs/manual/oclint-json-compilation-database.html"
license=('BSD')
dependencies=('python2')
source=("$_pkgname::git+https://github.com/oclint/oclint-json-compilation-database")
md5sums=('SKIP')

package() {
	cd "$srcdir/$_pkgname"

  mkdir -p $pkgdir/usr/bin
  install -m 755 oclint-json-compilation-database $pkgdir/usr/bin/oclint-json-compilation-database
}

pkgver() {
	cd "$srcdir/$_pkgname"

  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}
