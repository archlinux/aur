# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
pkgname=elisp-es
pkgver=20091212
_pkgver=1e8e9d693256
pkgrel=5
pkgdesc="An introduction to Emacs lisp (Spanish translation)"
arch=('any')
url="https://savannah.nongnu.org/git/?group=elisp-es"
license=('GPL')
makedepends=('texinfo')
source=(http://hg.savannah.gnu.org/hgweb/$pkgname/archive/$_pkgver.tar.gz)
md5sums=('6725111113858ec9a7f79923ad691585')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"
  sed -i 's/* Emacs Lisp Intro: (eintr)./* Introducción a Emacs lisp: (eintr-es)./g' emacs-lisp-intro-es.texi
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  makeinfo --paragraph-indent=0 --no-split --force emacs-lisp-intro-es.texi
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  tar -czf eintr-es.info.gz emacs-lisp-intro.info
  install -Dm644 eintr-es.info.gz $pkgdir/usr/share/info/eintr-es.info.gz
}
