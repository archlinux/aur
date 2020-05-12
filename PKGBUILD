# Maintainer: Hyperdriveguy <hyperdriveguy@gmail.com>
_pkgbase=fltk
pkgname=fltk-mod
pkgver=1.3.5.10305
pkgrel=1
pkgdesc="FLTK 1.3.5 using the latest abi version."
arch=('x86_64')
url='http://www.fltk.org/'
license=('LGPL')
depends=('libjpeg' 'libpng' 'zlib' 'libxinerama' 'libxft' 'libxcursor')
makedepends=('git' 'make')
provides=('fltk')
conflicts=('fltk')
source=("${pkgname}"::'git+https://github.com/hyperdriveguy/fltk-1.3.5-10305.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  chmod +x configure
  ./configure --prefix=/usr --with-abiversion=10305
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
