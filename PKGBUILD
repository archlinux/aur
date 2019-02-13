# Maintainer: <sl1pkn07@gmail.com>
# Contributor: <Themaister> <maister@archlinux.us>

pkgname=rsound
pkgver=1.1
pkgrel=5
pkgdesc='Simple solution for streaming PCM data from client to server in real time.'
url='http://github.com/Themaister/RSound'
arch=('x86_64')
license=('GPL')
depends=('libao'
         'openal'
         'libpulse'
         'portaudio'
         'jack'
         'libsamplerate'
         )
source=("https://github.com/Themaister/RSound/archive/v${pkgver}.tar.gz")
sha256sums=('dd4e32467360c5b49603da9f48bb4e69e4da4f60863a576a9df797091820faf3')

build() {
  cd "RSound-${pkgver}"
  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "RSound-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
}

