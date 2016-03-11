# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=16.03.11
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt4' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio' 'youtube-dl')
makedepends=('make' 'gcc' 'pkg-config')
source=("http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.xz")
sha256sums=(ad50a0f8d4d89011826b4d480555bbaac18ecb35de73e6a899f9be1e148c8976)
install=$pkgname.install

build()
{
	cd $srcdir/QMPlay2-src-$pkgver
	SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
	mv $srcdir/QMPlay2-src-$pkgver/app $pkgdir/usr
	mkdir -p $pkgdir/usr/share/mime/packages
	cp $srcdir/QMPlay2-src-$pkgver/src/gui/Unix/x-*.xml $pkgdir/usr/share/mime/packages
}
