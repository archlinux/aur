# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmiento-ala-nuclear.lu.se>
pkgname=emacs-annot-git
_pkgname=emacs-annot
pkgver=r62.964e6d0
pkgrel=1
pkgdesc="A global annotator/highlighter for GNU Emacs"
url="https://github.com/ghoshi/annot"
arch=('any')
license=('unknown')
depends=('emacs')
makedepends=('git')
provides=($_pkgname)

source=($_pkgname::git+https://github.com/ghoshi/annot.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd ${srcdir}/${_pkgname}/src || return 1

  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp || return 1

  install -Dm644 annot.el ${pkgdir}/usr/share/emacs/site-lisp/ || return 1
}
