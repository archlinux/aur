# Maintainer: Stoica Tedy (Tedyst) <stoicatedy@gmail.com>

pkgname=sdl_bgi
pkgver=2.5.0
pkgrel=1
pkgdesc="Port of the old Borland Graphics Interface (graphics.h), originally written for DOS, written using SDL2"
url="http://libxbgi.sourceforge.net/"
license=(ZLib)
arch=(any)
depends=(sdl2)
makedepends=(gettext gtk-doc shared-mime-info python lib32-libelf git util-linux
             meson lib32-dbus)
checkdepends=(desktop-file-utils lib32-glib2)
provides=('libSDL_bgi.so')
source=("https://sourceforge.net/projects/libxbgi/files/SDL_bgi-${pkgver}.tar.gz")
sha256sums=('4c936461a52b18db8300489f1ab4c6ac5f06e190f6c30d82f7df111a28efde84')

build() {
  cd "$srcdir/SDL_bgi-$pkgver/src"

  VERSION=$pkgver make
}

package() {
  install -Dm755 "$srcdir/SDL_bgi-$pkgver/src/libSDL_bgi.so" "$pkgdir/usr/lib/libSDL_bgi.so"
  install -Dm644 "$srcdir/SDL_bgi-$pkgver/src/SDL_bgi.h" "$pkgdir/usr/include/SDL2/SDL_bgi.h"
  install -Dm644 "$srcdir/SDL_bgi-$pkgver/src/graphics.h" "$pkgdir/usr/include/graphics.h"
}
