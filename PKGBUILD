# Maintainer: oech3

pkgname=opera-ffmpeg-vivaldi-symlink
pkgver=134.0.6998.178
pkgrel=1
pkgdesc="A stupid symlink for proprietary codecs for opera"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=( vivaldi-ffmpeg-codecs )
conflicts=( opera-{,developer-,beta-}ffmpeg-codecs{,-bin} )
provides=( opera-{,developer-,beta-}ffmpeg-codecs{,-bin} )
package() {
	for p in "${pkgdir}"/usr/lib/opera{,-developer,-beta}/lib_extra 
	do
	mkdir -p "$p"
	ln -sf /opt/vivaldi/libffmpeg.so* "$p"/libffmpeg.so
	done
}
