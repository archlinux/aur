# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=focuswriter
pkgver=1.6.7
pkgrel=1
pkgdesc='A simple fullscreen word processor'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'hunspell')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('bf78e596d7ed9de774bef5bbe75f1f0a01d626198fce6c8062a679936dfc3883')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
