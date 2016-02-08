# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=16.02.08
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt4' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio' 'youtube-dl')
makedepends=('make' 'gcc' 'pkg-config')
source=("http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.xz")
sha256sums=(012c1291a70d61a33a52dfbe1bd0649b565108c051d2ff0ef3a34a04bca49567)
install=$pkgname.install

build()
{
	cd $srcdir/QMPlay2-src-$pkgver
	NOTERM=1 SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
	mv $srcdir/QMPlay2-src-$pkgver/app $pkgdir/usr
	mkdir -p $pkgdir/usr/share/mime/packages
	cp $srcdir/QMPlay2-src-$pkgver/src/gui/Unix/x-*.xml $pkgdir/usr/share/mime/packages
}
