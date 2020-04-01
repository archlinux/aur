# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-psgml
_progname=psgml
pkgver=1.4.1
pkgrel=1
pkgdesc="An Emacs major mode for editing SGML documents"
depends=('emacs')
optdepends=('opensp: for onsgmls')
install=psgml.install
url="https://marmalade-repo.org/packages/${_progname}"
license=('GPL')
arch=('any')
source=("${url}-$pkgver.tar")
sha256sums=('74f7af1951cd637c2a2bc7f74b992b18524d98989b9dacaf9d33dfe93a8574a9')

build() {
  cd $_progname-$pkgver
  ./configure --prefix=/usr
  sed 's/prefix = \/usr/prefix = ${DESTDIR}\/usr/' -i Makefile
  make 
}

package() {
  cd $_progname-$pkgver
  make DESTDIR="$pkgdir" install
}
