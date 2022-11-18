pkgname=kylin-video
pkgver=2.1.2
pkgrel=1
pkgdesc='Front-end for MPlayer and MPV Qt5 Mplayer and MPV front-end, with basic features like playing videos and audios to more advanced features. It supports both x86 and ARM platform, and supports most of the audio and video formats.'
url='https://github.com/ukui/kylin-video'
arch=(x86_64)
source=('http://ftp.debian.org/debian/pool/main/k/kylin-video/kylin-video_2.1.2.orig.tar.gz')
sha512sums=('c7abd5f98e2426b1546027eef618fce9e2603d0008d5acd9117cf74c1ef3d0c481ac7af869aa12dc090cc1ff8a0d024a05b71db3b36bb745d090289cf6e174c3')
depends=('bash-completion' 'hicolor-icon-theme' 'libx11' 'mesa-vdpau' 'mpv>=0.6.2' 'qt5-base>=5.12.2')
makedepends=('qt5-tools' 'qt5-x11extras') 

build() {
tar -xvf kylin-video_2.1.2.orig.tar.gz
cd kylin-video
./autogen.sh
qmake
make
}

package() {
make DESTDIR=${pkgdir} install
}
