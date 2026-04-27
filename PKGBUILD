# Maintainer: EliasofWaffle <eliascontato@protonmail.com>

pkgname=libspatialaudio
pkgver=0.4.0
pkgrel=1
pkgdesc="Spatial audio encoding / decoding and binauralization library"
license=('LGPLv2' 'Proprietary')
arch=('x86_64')
makedepends=(
	'git'
	'meson'
	'gcc'
	'libmysofa'
	)
depends=('libmysofa')
source=('git+https://github.com/videolan/libspatialaudio')
sha256sums=('SKIP')

prepare(){
	cd libspatialaudio
        
	mkdir -p build
}

build(){

	arch-meson libspatialaudio build 
	
	meson compile -C build

}

check() {
  meson test -C build --print-errorlogs || true
}


package() {
	DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build install

}

