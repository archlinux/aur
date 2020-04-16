# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com> 
pkgname=carla-bridges
pkgver=2.1.0
_archive=Carla_${pkgver/.0/}-linux64
pkgrel=1
pkgdesc="Carla All Bridges (Stable Branch)"
arch=('x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
depends=('wine' 'carla')
source=("https://github.com/falkTX/Carla/releases/download/v2.1/${_archive}.tar.xz")
md5sums=('2163d9bc83c2f71b8ea0fd1a040168c6')

package() {	
    ## Goto Carla LV2 directory
	cd "$srcdir/${_archive}/carla.lv2"
	
	## Copy all bridges for standalone
	mkdir -p "$pkgdir/usr/lib/carla/"
	cp *.exe "$pkgdir/usr/lib/carla/"
	cp *.dll "$pkgdir/usr/lib/carla/"
	cp *posix32 "$pkgdir/usr/lib/carla/"
	
	## Copy all bridges for LV2
	mkdir -p "$pkgdir/usr/lib/lv2/carla.lv2"
	cp *.exe "$pkgdir/usr/lib/lv2/carla.lv2"
	cp *.dll "$pkgdir/usr/lib/lv2/carla.lv2"
	cp *posix32 "$pkgdir/usr/lib/lv2/carla.lv2"
	
	## Goto Carla VST directory
	cd "$srcdir/${_archive}/carla.vst"
	
	## Copy all bridges for VST
	mkdir -p "$pkgdir/usr/lib/vst/carla.vst"
	cp *.exe "$pkgdir/usr/lib/vst/carla.vst"
	cp *.dll "$pkgdir/usr/lib/vst/carla.vst"
	cp *posix32 "$pkgdir/usr/lib/vst/carla.vst"
}
