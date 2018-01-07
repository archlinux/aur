# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=nestopia
pkgver=1.48
pkgrel=1
pkgdesc='An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips.'
url='http://0ldsk00l.ca/nestopia/'
license=('GPL')
arch=('x86_64')
depends=('sdl2' 'alsa-lib' 'gtk3' 'glu' 'libarchive' 'libao')
makedepends=('unzip' 'mesa' 'xdg-utils' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rdanbrook/nestopia/tarball/$pkgver")
sha256sums=('ee14b9476748669ac1af73116beb2a6e3dd6b41c0b1d2f7149fb8716bb02d749')

build() {
  cd "$srcdir"/rdanbrook-nestopia-*
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir"/rdanbrook-nestopia-*
  make install DESTDIR="$pkgdir"
}
