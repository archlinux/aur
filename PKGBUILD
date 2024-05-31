# Maintainer: Rod Kay <rodakay5 at gnmail.com>

pkgname=sdlada
pkgver=2.5.20
pkgrel=1
pkgdesc="An Ada binding to SDL"

arch=(i686 x86_64)
url=https://github.com/Lucretia/sdlada
license=(zlib)

depends=(gcc-ada sdl2_ttf sdl2_image)

source=(https://github.com/ada-game-framework/sdlada/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(7cdf93318bc12df6e02a06e20e52c5efea31a86708e04317c27275ff7118e805)


build()
{
  cd $srcdir/$pkgname-$pkgver
  cd build/gnat

  make -j1 SDL_PLATFORM=linux SDL_BUILD=static SDL_MODE=release 
}


package() 
{
  cd $srcdir/$pkgname-$pkgver
  cd build/gnat

  make  SDL_PLATFORM=linux  SDL_BUILD=static  SDL_MODE=release  DESTDIR=$pkgdir/usr  install
}