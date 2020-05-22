# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=alltomp3
pkgname=alltomp3-bin
_pkgver=63
_LOver=0.3.17
pkgver=${_LOver}.${_pkgver}
pkgrel=1
arch=('x86_64')
license=('GPL-2.0')
url="https://alltomp3.org/"
pkgdesc="Download YouTube videos in MP3 with tags and lyrics"
depends=('gconf' 'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'ffmpeg' 'chromaprint' 'python-pathlib2')

source=("${_pkgname}_${_LOver}-${_pkgver}_amd64.deb::https://packagecloud.io/AllToMP3/alltomp3/packages/ubuntu/yakkety/${_pkgname}_${_LOver}-${_pkgver}_amd64.deb/download.deb")
sha256sums=('1ae8ffa9e18357a0a37d7be9968c2b8b3e2c3ea6cf7c81ee1e6cf3905605b2df')

package() {
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}/usr/bin"
    ln -sf '/opt/AllToMP3/alltomp3' "${pkgdir}/usr/bin/alltomp3"

    install -D -m644 "${pkgdir}/opt/AllToMP3/resources/app/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
