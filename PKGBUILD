# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=AllToMP3
pkgname=alltomp3-bin
_pkgver=0.3.19
pkgver=${_pkgver}.66
pkgrel=1
arch=('x86_64')
license=('GPL-2.0')
url="https://alltomp3.org"
pkgdesc="Download YouTube videos in MP3 with tags and lyrics"
depends=('chromaprint' 'giflib' 'hicolor-icon-theme' 'lcms2' 'libappindicator-gtk3'
         'libcroco' 'libnotify' 'libvips' 'libxss' 'nss' 'orc' 'python2-pathlib2')
conflicts=("${pkgname%-bin}")
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/${_pkgname}/${pkgname%-bin}-app/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums=('346962b3563dd2478513a5e5be60c5f8866910f64a190c5bdd7371c52dc13dfa')

package() {
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -D -m644 "${pkgdir}/opt/${_pkgname}/resources/app/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
