# Maintainer: Paul <GammaFunction@vivaldi.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>

pkgname=dtach-ng
pkgver=0.10.1
pkgrel=1
pkgdesc="emulates the detach feature of screen"
arch=("x86_64")
url=https://github.com/xPMo/dtach
license=('GPL')
depends=('glibc')
optdepends=('ncurses: Support for non-VT100 terminals')
conflicts=('dtach')
provides=('dtach')
source=(https://github.com/xPMo/dtach/archive/v${pkgver}.tar.gz)
sha256sums=('6be1fda719029b8be12e256ef4f2fbc138ad38d3841e508378e467c95e7db77e')

build() {
  cd ${pkgname%-ng}-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-ng}-$pkgver
  install -Dm755 dtach "$pkgdir"/usr/bin/dtach
  install -Dm644 dtach.1 "$pkgdir"/usr/share/man/man1/dtach.1
}
