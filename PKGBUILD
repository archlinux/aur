# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-emmet-mode-git
pkgver=20180613
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
source=("${pkgname}::git://github.com/smihica/emmet-mode.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"
  make all
}

package() {
  cd "$pkgname"
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/emmet-mode
  install -Dm644 emmet-mode.el emmet-mode.elc $pkgdir/usr/share/emacs/site-lisp/emmet-mode
}
