# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=svpflow1
pkgname=vapoursynth-plugin-${_plug}
pkgver=4.0.0.128
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='https://www.svp-team.com/wiki/Plugins:_SVPflow'
license=('GPL')
depends=('qt5-base' 'jsoncpp')
source=("svpflow1-src-${pkgver}.zip::http://www.svp-team.com/files/gpl/svpflow1-src.zip")
sha1sums=('7e32bec0c45895b6770ce814f040757f71e145a5')

build() {
  cd svpflow1-src/svpflow1
  qmake-qt5
  make release
}

package(){
  cd svpflow1-src/release
  install -Dm755 libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so.1.0.0"
  cd "${pkgdir}/usr/lib/vapoursynth/"
  ln -s libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so.1.0"
  ln -s libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so.1"
  ln -s libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so"
}
