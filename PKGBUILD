# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: goetzc <goetzchrist@gmail.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
 
pkgname=audio-recorder
pkgver=2.2.2
pkgrel=1
pkgdesc="Audio Recorder Application"
arch=('i686' 'x86_64')
url='https://launchpad.net/~audio-recorder'
license=('GPL3')
depends=('gst-plugins-base' 'gst-plugins-good' 'libappindicator-gtk3')
makedepends=('intltool')
optdepends=('pulseaudio: for extended recording capabilities'
            'gst-plugins-bad: for AAC encoding'
            'gst-plugins-ugly: for MP3 encoding'
            'gst-libav: plugin for the libav library')
source=("https://launchpad.net/~${pkgname}/+archive/ubuntu/ppa/+sourcefiles/${pkgname}/${pkgver}~cosmic/${pkgname}_${pkgver}~cosmic.tar.gz")
md5sums=('549f7a67624b10aa1011c297a16f6a78')
 
build() {
  cd "${srcdir}/trunk"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/trunk"
  make DESTDIR="${pkgdir}/" install
}
