# Contributor: Michael Orishich <mishaor2005@ukr.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ls_extended
pkgver=1
pkgrel=2
epoch=1
pkgdesc='ls with coloring and icons'
arch=('x86_64')
url="https://github.com/Electrux/ls_extended"
license=('custom:BSD')
optdepends=('nerd-fonts-symbols: for icon support')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Electrux/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c751e8198356cbbbbfe6191a6dd379d0525fea469299355ac8331090f2db63fe')

build() {
  cd "$pkgname-$pkgver"
  ./build.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
    install -D bin/ls_extended "$pkgdir"/usr/bin/$pkgname
}
