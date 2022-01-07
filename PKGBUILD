# Maintainer: Jesus Alonso <doragasu at hotmail dot com>

pkgname=crtview
pkgver=20220107.6e8cb5c
pkgrel=1
pkgdesc="View any image with CRT filter applied"
arch=('i686' 'x86_64' 'armv7h')
license=('None')
depends=('sdl2' 'glew')
PKGEXT="pkg.tar.zst"
source=(git+https://github.com/mattiasgustavsson/crtview.git)

sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}

  gcc source/main.c -O3 -lSDL2 -lGLEW -lGL -lm -lpthread -o ${pkgname}
}

package() {
  mkdir -p ${pkgdir}/usr/bin

  cp ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/usr/bin/
}
