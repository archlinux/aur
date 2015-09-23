# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=muzikq
_pkgname=muzikQ
pkgver=0.5
pkgrel=2
pkgdesc="A curses/SDL_mixer based audio player currently supporting mp3 & ogg."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/muzikq/"
license=('GPL3')
depends=('sdl_mixer' 'taglib')
source=("http://prdownloads.sourceforge.net/muzikq/$_pkgname-$pkgver.tar.gz")
md5sums=('1883f07506fab8441d49917ed8c171e9')
sha1sums=('6d2cde74bf8d077088f1bcc3db9b45b5428dfae4')
sha256sums=('b8356fb99731d6bd424ebd4df5f28037c251680a8a7418e8a1e530a9cec817a0')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

