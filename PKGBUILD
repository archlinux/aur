# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=alltomp3
pkgname=alltomp3-bin
pkgver=0.3.4
pkgrel=1
arch=('x86_64')
license=('GPL-2.0')
url="https://alltomp3.org/"
pkgdesc="Download YouTube videos in MP3 with tags and lyrics"
depends=('gconf' 'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'ffmpeg' 'chromaprint')

source=("${_pkgname}_${pkgver}_amd64.deb::https://packagecloud.io/AllToMP3/alltomp3/packages/linuxmint/qiana/${_pkgname}_${pkgver}_amd64.deb/download.deb")
sha256sums=('196089f5cce021bdfd2b732e221edae59752c47281609f10e41343b1c13e810e')

prepare() {
	tar -xJf data.tar.xz
}

package() {
	cd "$srcdir"
	# dump usr files to /usr
	mv usr "$pkgdir"
	# dump opt files to /opt
	mv opt "$pkgdir"
}
