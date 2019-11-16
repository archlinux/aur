# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: goetzc <goetzchrist@gmail.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
 
pkgname=audio-recorder
pkgver=3.1.1
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
source=("https://launchpad.net/~${pkgname}/+archive/ubuntu/ppa/+sourcefiles/${pkgname}/${pkgver}~eoan/${pkgname}_${pkgver}~eoan.tar.gz")
md5sums=('11cc94078d39c7ac5a5d1ade4125c8fa')
 
build() {
  cd "${srcdir}/trunk"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/trunk"
  make DESTDIR="${pkgdir}/" install
}
