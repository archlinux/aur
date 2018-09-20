# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=alltomp3
pkgname=alltomp3-bin
_pkgver=44
pkgver=0.3.6
pkgrel=1
arch=('x86_64')
license=('GPL-2.0')
url="https://alltomp3.org/"
pkgdesc="Download YouTube videos in MP3 with tags and lyrics"
depends=('gconf' 'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'ffmpeg' 'chromaprint')

source=("${_pkgname}_${pkgver}-${_pkgver}_amd64.deb::https://packagecloud.io/AllToMP3/alltomp3/packages/ubuntu/yakkety/${_pkgname}_${pkgver}-${_pkgver}_amd64.deb/download.deb")
sha256sums=('ba57f1e3f8bfa134f6a56b3aade8db60f8fcd02e6921bb3193630172fa91334c')

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
