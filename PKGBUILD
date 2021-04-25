# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-less-css-mode-git
pkgver=20181102
pkgrel=1
pkgdesc="Major mode for LESS CSS (lesscss.org), with support for compile-on-save."
arch=('any')
url="https://github.com/purcell/less-css-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-less-css-mode')
replaces=('emacs-less-css-mode')
install=$pkgname.install
source=("${pkgname}::git://github.com/purcell/less-css-mode.git")
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
  install less-css-mode.el $pkgdir/usr/share/emacs/site-lisp/
}
