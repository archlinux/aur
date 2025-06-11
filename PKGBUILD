# Maintainer: oech3

pkgname=opera-ffmpeg-vivaldi-symlink
pkgver=136.0.7103.113
pkgrel=1
pkgdesc="Proprietary codecs for Opera"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=( vivaldi-ffmpeg-codecs )
conflicts=( opera-{,developer-,beta-}ffmpeg-codecs{,-bin} )
provides=( opera-{,developer-,beta-}ffmpeg-codecs{,-bin} )
package() {
  for p in "${pkgdir}"/usr/lib/opera{,-developer,-beta}/lib_extra 
  do
  install -d "$p"
  ln -sf /opt/vivaldi/libffmpeg.so* "$p"/libffmpeg.so
  done
}
