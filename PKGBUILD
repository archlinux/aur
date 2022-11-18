pkgname=kylin-video
pkgver=2.0.1
pkgrel=1
pkgdesc='Front-end for MPlayer and MPV Qt5 Mplayer and MPV front-end, with basic features like playing videos and audios to more advanced features. It supports both x86 and ARM platform, and supports most of the audio and video formats.'
url='https://github.com/ukui/kylin-video'
arch=(
    'x86_64'
)
source=(
    "https://github.com/UbuntuKylin/kylin-video/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '506b77e5e4a5f173354a593cff915f189f3ce4d64723d7795fe68b638731ea42'
)
depends=(
    'bash-completion'
    'hicolor-icon-theme'
    'libx11'
    'mesa-vdpau'
    'qt5-base'
)
makedepends=(
    'qt5-tools'
    'qt5-x11extras'
)
 
 
#prepare()
#{
#   tar -xvf kylin-video_2.1.2.orig.tar.gz
#}
 
 
build()
{
cd "kylin-video-${pkgver}"
    ./autogen.sh
    qmake
    make
}
 
 
package()
{
    make DESTDIR=${pkgdir} install
}
 