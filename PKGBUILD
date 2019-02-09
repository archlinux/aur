# Contributor: Michael Orishich <mishaor2005@ukr.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ls_extended
pkgver=1.0.0
pkgrel=4
pkgdesc='ls with coloring and icons'
arch=('x86_64')
url="https://github.com/Electrux/ls_extended"
license=('custom:BSD')
makedepends=('ccp4m')
optdepends=('nerd-fonts-complete: for icon support')
depends=('glibc' 'ttf-nerd-fonts-symbols')
provides=('ls')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Electrux/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c6af08877e889fe0732f25f7e6f850c7816cf7788fee191bcc80dbf1288b3740')

build() {
    cd "$pkgname-$pkgver"
    ccp4m project build
    ccp4m project test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
    install -D bin/ls_extended "$pkgdir"/usr/bin/$pkgname
}
