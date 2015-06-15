#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Luiz Augusto S. Carvalho <lgusto at gmail dot com>

pkgname=yapan
pkgver=0.4.3
pkgrel=2
pkgdesc="Yet Another Package mAnager Notifier."
arch=('i686' 'x86_64')
url="https://code.google.com/p/arch-yapan/"
license=('GPL')
depends=('qt4' 'phonon')
optdepends=('libnotify: to use notify-send.')
source=(https://arch-yapan.googlecode.com/files/$pkgname-$pkgver.tar.lzma)
sha256sums=('97df42269a58af63db1f0afafedd227bd5b8a6fb5241199b6c359096226ac9d9')
 
build() {
  cd "$srcdir/$pkgname-$pkgver/"
  lupdate-qt4 -noobsolete -silent yapan.pro
  lrelease-qt4 -silent yapan.pro
  qmake-qt4
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
