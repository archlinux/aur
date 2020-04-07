# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: aimileus < me at aimileus dot nl >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=nestopia
pkgver=1.50
pkgrel=1
pkgdesc='An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips.'
url='http://0ldsk00l.ca/nestopia/'
license=('GPL')
arch=('x86_64')
depends=('sdl2' 'gtk3' 'libarchive')
makedepends=('unzip' 'mesa' 'xdg-utils' 'autoconf-archive')
source=($pkgname-$pkgver.tar.gz::"https://github.com/0ldsk00l/nestopia/archive/$pkgver.tar.gz")
sha256sums=('f0274f8b033852007c67237897c69725b811c0df8a6d0120f39c23e990662aae')

build() {
  cd $pkgname-$pkgver

  autoreconf -fi
  ./configure --prefix=/usr --enable-gui
  make
}

package() {
  make -C $pkgname-$pkgver install DESTDIR="$pkgdir"
}
