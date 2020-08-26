# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: James Cozine <jmcozine@gmail.com>

pkgname=dictionary
pkgver=1.11
pkgrel=1
pkgdesc="Emacs interface to dictd dictionary servers."
arch=('any')
url="https://www.myrkr.in-berlin.de/dictionary/"
license=('GPL')
depends=('emacs')
install="$pkgname.install"
source=("https://github.com/myrkr/$pkgname-el/archive/v$pkgver.tar.gz")
md5sums=('a6f427e60c65fa610d89f8aad1abf211')

build() {
  cd "${srcdir}/${pkgname}-el-${pkgver}"
  make 
}

package() {
  cd "${srcdir}/${pkgname}-el-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/dictionary"
  install -m 644 *.el{,c} "${pkgdir}/usr/share/emacs/site-lisp/dictionary"
}
