# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=15.12.25
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt4' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio' 'youtube-dl')
makedepends=('make' 'gcc' 'pkg-config')
source="http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.xz"
sha256sums=(41486c3dd147582f607f7c93cc75bf3031601978b73a111832c459fea99846b5)
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
