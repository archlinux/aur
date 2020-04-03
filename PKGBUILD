# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: goetzc <goetzchrist@gmail.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
 
pkgname=audio-recorder
pkgver=3.1.3
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
source=("https://launchpad.net/~${pkgname}/+archive/ubuntu/ppa/+sourcefiles/${pkgname}/${pkgver}~focal/${pkgname}_${pkgver}~focal.tar.gz")
md5sums=('a66f7aa3010d98d376a25c814d7804a0')

build() {
  cd "${srcdir}/trunk"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/trunk"
  make DESTDIR="${pkgdir}/" install
}
