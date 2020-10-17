# Maintainer:  Mort Yao <soi@mort.ninja>
# Contributor: Ismael Barros² (RazZziel) <razielmine@gmail.com>

pkgname=emacs-android-git
pkgver=20190903
pkgrel=1
pkgdesc="Emacs minor mode for Android application development"
arch=('any')
url="http://github.com/remvee/android-mode/"
license=('GPL3')
depends=('emacs')
makedepends=('git')
install=$pkgname.install
source=("${pkgname}::git://github.com/remvee/android-mode.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"
}

package() {
  cd "$pkgname"
  install -d $pkgdir/usr/share/emacs/site-lisp/
  install android-mode.el $pkgdir/usr/share/emacs/site-lisp/
}
