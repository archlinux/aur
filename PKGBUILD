# Maintainer: Hyperdriveguy <hyperdriveguy@gmail.com>
_pkgbase=fltk
pkgname=fltk-mod
pkgver=1.3.7.10307
pkgrel=2
pkgdesc="FLTK 1.3.7 using the latest abi version."
arch=('x86_64')
url='http://www.fltk.org/'
license=('LGPL')
depends=('libjpeg' 'libpng' 'zlib' 'libxinerama' 'libxft' 'libxcursor')
makedepends=('git' 'make')
provides=('fltk')
conflicts=('fltk')
source=("${pkgname}"::'git+https://github.com/fltk/fltk.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  git checkout 70ebfdb

  chmod +x autogen.sh
  ./autogen.sh --prefix=/usr --with-abiversion=10307
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
