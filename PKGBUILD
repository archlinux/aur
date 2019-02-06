# Maintainer: <sl1pkn07@gmail.com>
# Contributor: <Themaister> <maister@archlinux.us>

pkgname=rsound
pkgver=1.1
pkgrel=4
pkgdesc='Simple solution for streaming PCM data from client to server in real time.'
url='http://github.com/Themaister/RSound'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libao' 'portaudio' 'openal' 'libpulse')
optdepends=('alsa-lib' 'pulseaudio' 'jack')
makedepends=('libao' 'portaudio' 'openal' 'alsa-lib' 'pulseaudio' 'jack')
source=("https://github.com/Themaister/RSound/archive/v${pkgver}.tar.gz")
sha256sums=('dd4e32467360c5b49603da9f48bb4e69e4da4f60863a576a9df797091820faf3')

build() {
  cd "RSound-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "RSound-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" install
}

