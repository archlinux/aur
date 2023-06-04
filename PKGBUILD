# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: bacteriostat <dev.bacteriostat at aleeas dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
pkgname="spotiflyer-bin"
_appname="SpotiFlyer"
pkgver=3.6.3
pkgrel=2
pkgdesc="Kotlin Multiplatform Music Downloader, Supports Spotify / Gaana / Youtube Music / Jio Saavn / SoundCloud."
arch=('x86_64')
url="https://soundbound.shabinder.in/install"
_githuburl="https://github.com/Shabinder/SpotiFlyer"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('alsa-lib' 'fontconfig' 'glibc' 'libx11' 'libxtst' 'libglvnd' 'libxext' 'libxi' 'libxrender' 'java-runtime' 'zlib')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('9038e09d4e4d0eff02bbb10fc02728f11e73e46973e23297d0ff189dfdce0aae')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|/opt/${pkgname%-bin}/lib/${_appname}.png|${pkgname%-bin}|g;s|Unknown|AudioVideo|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}