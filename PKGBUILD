# Maintainer: prurigro
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=lincity-ng
pkgname=$_pkgname-beta
pkgver=2.9
pkgrel=2
pkgdesc='A city simulation game'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/lincity-ng.berlios/'
license=('GPL')
depends=('sdl_mixer' 'sdl_ttf' 'sdl_image' 'physfs' 'libxml2' 'sdl_gfx' 'libgl')
makedepends=('ftjam' 'glu')
source=("http://downloads.sourceforge.net/project/$_pkgname.berlios/$_pkgname-$pkgver.beta.tar.bz2")
sha512sums=('3ec9997971c7c5a0d027cc09cb7608f965122d5f7dccc7bffcab1bf84d50db495a2b42131ec80a049138a35625c7cfe6e49214be248cdceeefe056616ff71bc9')

build() {
  cd $_pkgname-$pkgver.beta
  ./configure --prefix=/usr
  jam
}

package() {
  cd $_pkgname-$pkgver.beta
  jam -sprefix="$pkgdir/usr" install
  install -Dm644 COPYING-data.txt "$pkgdir/usr/share/licenses/$_pkgname/COPYING-data.txt"
  install -Dm644 COPYING-fonts.txt "$pkgdir/usr/share/licenses/$_pkgname/COPYING-fonts.txt"
}
