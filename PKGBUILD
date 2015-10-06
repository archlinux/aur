# Maintainer: abf <zouxiaoming@gmail.com>

pkgname=auto-complete
pkgver=1.5.0
pkgrel=2
pkgdesc="A plugin for emacs that allows to auto-complete.Auto Complete Mode is the most intelligent auto-completion extension for GNU Emacs."
arch=('any')
url="http://auto-complete.org/"
license=('GPL3')
depends=('emacs-popup-el')
makedepends=('emacs' 'cask')
optdepends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auto-complete/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('014530e9988c3f5e98c7993cce0ecd6b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/
  make DIR="$pkgdir/usr/share/$pkgname" install 
  ln -s /usr/share/$pkgname $pkgdir/usr/share/emacs/site-lisp/$pkgname
}

# vim:set ts=2 sw=2 et:
