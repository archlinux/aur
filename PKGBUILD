# Maintainer: M0Rf30
# Contributor: OK100 <ok100@lavabit.com>
# Contributor: Jeremy Newton (Mystro256)
# Contributor: Ivan Nikolaev <voidexp@gmail.com>
# Contributor: Christian Ohrfandl (ToxicDragon)

pkgname=guitar-pro
pkgver=11686
pkgrel=1
pkgdesc="A popular tablature editor software for guitar, bass, and many other instruments."
url="http://www.guitar-pro.com"
arch=('i686' 'x86_64')
license=('Proprietary')				
depends_x86_64=('gksu' 'lib32-glib2' 'lib32-libpulse' 'lib32-libgl' 'lib32-libxml2' 'lib32-portaudio' 'pulseaudio' 'lib32-zlib'
'lib32-libpng12' 'lib32-libxrender' 'lib32-freetype2' 'lib32-fontconfig')
makedepends_x86_64=('binutils' 'tar')
depends=('gksu' 'glib2' 'libgl' 'libxml2' 'portaudio' 'pulseaudio' 'zlib' 'libxrender' 'freetype2' 'libpng12')
makedepends=('binutils' 'tar')

source=("http://downloads.guitar-pro.com/gp6/gp6-full-linux-r$pkgver.deb"
	#"https://dl.dropbox.com/u/15563529/GuitarPro6/gp6-full-linux-r11553.deb" #previous version
	"https://dl.dropboxusercontent.com/sh/29kr9dvw7gnmojk/AAC9yXcEWbxXgtBL5wUcgam_a/libcrypto.so.0.9.8"
	"https://dl.dropboxusercontent.com/sh/29kr9dvw7gnmojk/AADCm1FBezXrR3ZosGBS8wUva/libssl.so.0.9.8")

build() {
	cd "$srcdir"
	tar xvzf data.tar.gz || return 1
}
     
package() {  
	cd "$srcdir"

	mv -v opt $pkgdir
	mv -v usr $pkgdir

	install -m755 -D libcrypto.so.0.9.8 $pkgdir/opt/GuitarPro6
	install -m755 -D libssl.so.0.9.8 $pkgdir/opt/GuitarPro6
}

md5sums=('3de3b59151b33965a92cd4f51162aeee'
	 'e66ee85eccfa5e5d0aabedcd13c6c8b4'
	 '8d7331135369f0dc131c4a95f034c4b7')
