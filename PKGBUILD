# Maintainer: Paul <GammaFunction@vivaldi.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>

pkgname=dtach-ng
pkgver=0.10
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
sha256sums=('06e386fd3ff3af17aa3b6a54f1357bc6d2554937c8e6f588019a12bfb2410cd1')

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
