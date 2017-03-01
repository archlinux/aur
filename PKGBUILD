# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <gianni@rootcube.net>
# Contributor: Gour <gour@atmarama.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-d-mode  
pkgver=2.0.9
pkgrel=2
pkgdesc="Emacs major mode for the D programming language"
url="https://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode"
arch=('any')
license=('GPL2')
depends=()
makedepends=(emacs)
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::yhttps://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode/archive/$pkgver.tar.gz)
sha256sums=('6d8e2f3f201a829fcad82353a85a22c627d78c007da5311ee1e78e1ecf51ea88')


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

