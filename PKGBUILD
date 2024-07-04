# Maintainer: Mort Yao <soi@mort.ninja>

_pkgname=emacs-emmet-mode
pkgname=$_pkgname-git
pkgver=20240617
pkgrel=1
pkgdesc="Minor mode providing support for Zen Coding, with Emmet's feature expansion."
arch=('any')
url="https://github.com/smihica/emmet-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-emmet-mode')
replaces=('emacs-emmet-mode')
install=$pkgname.install
source=("${_pkgname}::git+https://github.com/smihica/emmet-mode.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$_pkgname"
  make all
}

package() {
  cd "$_pkgname"
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/emmet-mode
  install -Dm644 emmet-mode.el emmet-mode.elc $pkgdir/usr/share/emacs/site-lisp/emmet-mode
}
