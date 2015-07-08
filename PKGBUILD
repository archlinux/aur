# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=15.06.26
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt4' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb')
optdepends=('pulseaudio' 'youtube-dl')
makedepends=('make' 'gcc')
source="http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.bz2"
sha256sums=(fa35769d1742cee415ee1b4fec7f90c2f5b00b4f55b8774c98134d4925a6a728)

build()
{
    cd $srcdir/QMPlay2-src
    NOTERM=1 SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
    mv $srcdir/QMPlay2-src/app $pkgdir/usr
}
