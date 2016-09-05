# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=dario
pkgver=1.1
pkgrel=1
pkgdesc='A falling block game made for Ludum Dare 32'
url='http://ludumdare.com/compo/ludum-dare-32/?action=preview&uid=50659'
license=('MIT')
arch=('i686' 'x86_64')
depends=('sdl2' 'sdl2_mixer')
provides=('dario')
source=("https://github.com/bentglasstube/ld32/archive/v$pkgver.tar.gz")
sha1sums=('9fc7a3d7f7338b4fcf06f91f7ca7317ad70f65d4')

build() {
  cd "$srcdir/ld32-$pkgver"
  make
}

package() {
  cd "$srcdir/ld32-$pkgver"

  install -Dm 775 build/dario $pkgdir/usr/share/dario/game
  install -Dm 775 launcher $pkgdir/usr/share/dario/launcher
  install -Dt $pkgdir/usr/share/dario/content content/*
}
