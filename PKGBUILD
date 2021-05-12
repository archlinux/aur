# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-arduino-mode-git
pkgver=20160102
pkgrel=1
pkgdesc="Major mode for the Arduino language."
arch=('any')
url="https://github.com/bookest/arduino-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-arduino-mode')
replaces=('emacs-arduino-mode')
install=$pkgname.install
source=("${pkgname}::git://github.com/bookest/arduino-mode.git")
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
  install arduino-mode.el $pkgdir/usr/share/emacs/site-lisp/
}
