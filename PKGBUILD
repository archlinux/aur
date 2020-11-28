# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=alltomp3
pkgname=alltomp3-bin
_pkgver=66
_LOver=0.3.19
pkgver=${_LOver}.${_pkgver}
pkgrel=1
arch=('x86_64')
license=('GPL-2.0')
url="https://alltomp3.org/"
pkgdesc="Download YouTube videos in MP3 with tags and lyrics"
depends=('chromaprint' 'giflib' 'hicolor-icon-theme' 'lcms2' 'libappindicator-gtk3'
         'libcroco' 'libnotify' 'libvips' 'libxss' 'nss' 'orc' 'python2-pathlib')
conflicts=("${_pkgname}")
source=("${_pkgname}_${_LOver}-${_pkgver}_amd64.deb::https://packagecloud.io/AllToMP3/alltomp3/packages/ubuntu/yakkety/${_pkgname}_${_LOver}-${_pkgver}_amd64.deb/download.deb")
sha256sums=('62cfd5a4ca0b8fc9ad8e18c3cda3d6b05ce1957d0c58de20d98067e40f3f09a2')

package() {
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}/usr/bin"
    ln -sf '/opt/AllToMP3/alltomp3' "${pkgdir}/usr/bin/alltomp3"

    install -D -m644 "${pkgdir}/opt/AllToMP3/resources/app/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
