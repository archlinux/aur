# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <gianni@rootcube.net>
# Contributor: Gour <gour@atmarama.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-d-mode  
pkgver=2.0.12
pkgrel=1
pkgdesc="Emacs major mode for the D programming language"
url="https://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode"
arch=('any')
license=('GPL2')
depends=()
makedepends=(emacs)
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('30a3515904bd47fc70a638e0473eb0eaaf702731bece9394f4c26e85cdc49282')

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

