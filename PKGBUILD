# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=alltomp3
pkgname=alltomp3-bin
_pkgver=49
_LOver=0.3.6
pkgver=0.3.6.${_pkgver}
pkgrel=1
arch=('x86_64')
license=('GPL-2.0')
url="https://alltomp3.org/"
pkgdesc="Download YouTube videos in MP3 with tags and lyrics"
depends=('gconf' 'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'ffmpeg' 'chromaprint' 'python2-pathlib')

source=("${_pkgname}_${_LOver}-${_pkgver}_amd64.deb::https://packagecloud.io/AllToMP3/alltomp3/packages/ubuntu/yakkety/${_pkgname}_${_LOver}-${_pkgver}_amd64.deb/download.deb")
sha256sums=('1047f728cee4000aa2bfb4b2dd61e5758c479df83a8afe44314374333a2e1be3')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "/opt/AllToMP3/resources/app/node_modules/zero-fill/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
