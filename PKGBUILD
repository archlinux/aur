# Maintainer: oech3

pkgname=opera-ffmpeg-vivaldi-symlink
pkgver=136.0.7103.113
pkgrel=2
pkgdesc="Proprietary codecs for Opera"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=( vivaldi-ffmpeg-codecs )
conflicts=( opera-{,developer-,beta-}ffmpeg-codecs{,-bin} vivaldi-snapshot-ffmpeg-codecs)
provides=("${conflicts[@]}")
# provides=( opera-{,developer-,beta-}ffmpeg-codecs{,-bin} vivaldi-snapshot-ffmpeg-codecs)
package() {
  for p in "${pkgdir}"/usr/lib/opera{,-developer,-beta}/lib_extra
  do
    install -d "$p"
    ln -svf /opt/vivaldi/libffmpeg.so* "$p"/libffmpeg.so
  done
  install -d "$pkgdir/opt/vivaldi-snapshot"
  ln -svf /opt/vivaldi/libffmpeg.so* "$pkgdir"/opt/vivaldi-snapshot/libffmpeg.so.7.5
}
