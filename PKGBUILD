# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: James Cozine <jmcozine@gmail.com>

pkgname=dictionary
pkgver=1.10
pkgrel=1
pkgdesc="Emacs interface to dictd dictionary servers."
arch=('any')
url="http://www.myrkr.in-berlin.de/dictionary/"
license=('GPL')
depends=('emacs')
install="$pkgname.install"
source=("http://www.myrkr.in-berlin.de/dictionary/$pkgname-$pkgver.tar.gz")
md5sums=('fdd7d53d1010261276dbb23ea15f017a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/dictionary"
  install -m 644 *.el{,c} "${pkgdir}/usr/share/emacs/site-lisp/dictionary"
}
