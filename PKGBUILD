# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2-git
pkgver=15.06.10
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt4' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb')
optdepends=('pulseaudio' 'youtube-dl')
conflicts=('qmplay2')
provides=('qmplay2')
makedepends=('make' 'gcc' 'git')
source=('git+https://github.com/zaps166/QMPlay2')
sha256sums=('SKIP')

pkgver()
{
    cat $srcdir/QMPlay2/src/qmplay2/headers/QMPlay2Core.hpp | grep QMPlay2Version | cut -c25-32
}

build()
{
    cd $srcdir/QMPlay2
    NOTERM=1 SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
    mv $srcdir/QMPlay2/app $pkgdir/usr
}
