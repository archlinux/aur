# Maintainer: Rod Kay <rodakay5 at gnmail.com>

pkgname=sdlada
pkgver=2.5.6
pkgrel=1
pkgdesc="An Ada binding to SDL"

arch=('i686' 'x86_64')
url="https://github.com/Lucretia/sdlada/"
license=('zlib')

depends=("gcc-ada" "sdl2_ttf" "sdl2_image")

source=(https://github.com/Lucretia/sdlada/archive/v$pkgver.tar.gz)
sha256sums=('15431f8475d1957f8a60e790c46051e95189b1fd99798724d2f659d6827ba8eb')


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