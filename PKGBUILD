# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: goetzc <goetzchrist@gmail.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
 
pkgname=audio-recorder
pkgver=1.9.3
pkgrel=1
pkgdesc="Free audio-recorder for Linux"
arch=('i686' 'x86_64')
url='https://launchpad.net/~audio-recorder'
license=('GPL3')
depends=('gst-plugins-base' 'gtk3' 'libappindicator-gtk3')
makedepends=('intltool')
optdepends=('pulseaudio: for extended recording capabilities'
            'gst-plugins-good: for WAV and Flac encoding'
            'gst-plugins-bad: for AAC encoding'
            'gst-plugins-ugly: for MP3 encoding')
source=("https://launchpad.net/~${pkgname}/+archive/ubuntu/ppa/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('d7d9e06748ebf9855827cdcbae45f79c')
 
build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
