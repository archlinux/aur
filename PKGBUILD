# Maintainer: eagletmt <eagletmt@gmail.com>
pkgname=teyjus
pkgver=2.0_b2
pkgrel=1
pkgdesc='An efficient implementation of the higher-order logic programming language Lambda Prolog'
url='http://code.google.com/p/teyjus/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('ocaml' 'omake' 'flex' 'bison')
source=(http://teyjus.googlecode.com/files/$pkgname-source-${pkgver/_/-}.tar.gz)

build () {
  cd "$srcdir/$pkgname"
  omake
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  local bin
  for bin in tjcc tjdepend tjdis tjlink tjsim
  do
    install -m755 $bin "$pkgdir/usr/bin/"
  done

  mkdir -p "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 emacs/teyjus.el "$pkgdir/usr/share/emacs/site-lisp/"
}

# vim:set ts=2 sw=2 et:
md5sums=('80de9349841bf93ae67101d66e389d61')
