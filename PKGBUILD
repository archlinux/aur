# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: aimileus < me at aimileus dot nl >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=nestopia
pkgver=1.49
pkgrel=1
pkgdesc='An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips.'
url='http://0ldsk00l.ca/nestopia/'
license=('GPL')
arch=('x86_64')
depends=('sdl2' 'gtk3' 'libarchive' 'libao')
makedepends=('unzip' 'mesa' 'xdg-utils' 'git' 'autoconf-archive')
source=("git+https://github.com/rdanbrook/nestopia.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make install DESTDIR="$pkgdir"
}
