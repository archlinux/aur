# Maintainer: Mort Yao <soi@mort.ninja>

_pkgname=emacs-arduino-mode
pkgname=$_pkgname-git
pkgver=20160102
pkgrel=2
pkgdesc="Major mode for the Arduino language."
arch=('any')
url="https://github.com/bookest/arduino-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-arduino-mode')
replaces=('emacs-arduino-mode')
install=$pkgname.install
source=("${_pkgname}::git+https://github.com/bookest/arduino-mode.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {
  cd $_pkgname
  install -d $pkgdir/usr/share/emacs/site-lisp/
  install arduino-mode.el $pkgdir/usr/share/emacs/site-lisp/
}
