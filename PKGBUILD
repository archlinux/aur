# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sdl-compat_image
pkgver=1.2.12
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces"
url="https://www.libsdl.org/projects/SDL_image/"
arch=(x86_64)
license=(custom)
depends=('sdl' libpng libjpeg-turbo libtiff zlib)
provides=('libSDL_image-1.2.so' 'sdl_image')
conflicts=('sdl_image')
source=(https://www.libsdl.org/projects/SDL_image/release/SDL_image-$pkgver.tar.gz)
sha256sums=('0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699')

build() {
  cd SDL_image-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd SDL_image-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
