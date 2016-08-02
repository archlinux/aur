# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop@nuclear.lu.se>
pkgname=htmlize-git
_pkgname=htmlize
pkgver=r96.aa6e2f6
pkgrel=1
pkgdesc="Convert buffer text and decorations to HTML"
url="http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi"
arch=('any')
license=('GPL2')
depends=('emacs')
provides=("htmlize")
makedepends=('git')

source=($_pkgname::git+http://fly.srk.fer.hr/~hniksic/emacs/htmlize.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -m644 -D ${srcdir}/$_pkgname/htmlize.el $pkgdir/usr/share/emacs/site-lisp/htmlize.el
}
