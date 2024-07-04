# Maintainer:  Mort Yao <soi@mort.ninja>
# Contributor: Ismael Barros² (RazZziel) <razielmine@gmail.com>

_pkgname=emacs-android
pkgname=$_pkgname-git
pkgver=20190903
pkgrel=2
pkgdesc="Emacs minor mode for Android application development"
arch=('any')
url="http://github.com/remvee/android-mode/"
license=('GPL3')
depends=('emacs')
makedepends=('git')
install=$pkgname.install
source=("${_pkgname}::git+https://github.com/remvee/android-mode.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {
  cd "$_pkgname"
  install -d $pkgdir/usr/share/emacs/site-lisp/
  install android-mode.el $pkgdir/usr/share/emacs/site-lisp/
}
