# Contributor: Michael Orishich <mishaor2005@ukr.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ls_extended
pkgver=1.1.0
pkgrel=3
pkgdesc='ls with coloring and icons'
arch=('x86_64')
url="https://github.com/Electrux/ls_extended"
license=('custom:BSD')
optdepends=('nerd-fonts-complete: for icon support')
depends=('glibc' 'ttf-nerd-fonts-symbols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Electrux/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3ea78c2deb89aa5b5047984815c52baa95e68668471c2ea2b1f9e9d46ce380c8')

build() {
  cd "$pkgname-$pkgver"
  ./build.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
    install -D bin/ls_extended "$pkgdir"/usr/bin/$pkgname
}
