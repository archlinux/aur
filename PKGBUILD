# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=15.10.18
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt4' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb')
optdepends=('pulseaudio' 'youtube-dl')
makedepends=('make' 'gcc' 'pkg-config')
source="http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.xz"
sha256sums=(170aa7a8939dfc6b0e8a8a2a073aae92115ebfd996e36a9a823d4c2cbc73ff42)

build()
{
    cd $srcdir/QMPlay2-src-$pkgver
    NOTERM=1 SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
    mv $srcdir/QMPlay2-src-$pkgver/app $pkgdir/usr
}
