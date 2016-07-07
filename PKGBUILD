# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <gianni@rootcube.net>
# Contributor: Gour <gour@atmarama.net>

pkgname=emacs-d-mode  
pkgver=2.0.8
pkgrel=1 
pkgdesc="Emacs major mode for the D programming language"
url="http://www.wikiservice.at/d/wiki.cgi?EditorSupport/EmacsEditor"
arch=('any')
license=('GPL2')
depends=()
makedepends=(emacs)
install=$pkgname.install
source=(https://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode/archive/$pkgver.tar.gz)
sha256sums=('80ab7e82ebbb6afe4c7d9ab8e4feb597d2f84bd91739ac04120954594a7cd74e')


build() {
  cd "$srcdir/Emacs-D-Mode-$pkgver"

  make compile
}

package() {
  cd "$srcdir/Emacs-D-Mode-$pkgver"

  install -m755 -d "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 d-mode.el "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 d-mode.elc "$pkgdir/usr/share/emacs/site-lisp"
}

