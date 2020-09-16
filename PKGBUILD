# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=freeorion-bin
pkgver=0.4.10
pkgrel=1
pkgdesc='A free, Open Source, turn-based space empire and galactic conquest computer game'
url='https://www.freeorion.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python'
         'sdl2'
         'libvorbis'
         'openal'
         'freetype2'
         'freeorion-data')
conflicts=('freeorion-git' 'freeorion')
source=("${pkgname%-bin}-${pkgver}.deb::http://http.us.debian.org/debian/pool/main/f/freeorion/freeorion_${pkgver}-1_amd64.deb")
sha256sums=('8a4424a414895f72736429448849b6075fe858f62df62aa6529f597559963c09')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/games/freeorion" "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/games" 
}