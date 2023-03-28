# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=boostchanger
pkgname="${_pkgname}-bin"
pkgver=5.0.2
pkgrel=2
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('x86_64')
url="https://github.com/nbebaw/boostchanger"
license=(MIT)
providers=(nbebaw)
conflits=("${_pkgname}-git" "${_pkgname}-py" "${_pkgname}-appimage")
depends=(at-spi2-core alsa-lib gtk3 nss glibc cairo hicolor-icon-theme mesa libxrandr libxcomposite libx11 \
        libxfixes pango nspr libxdamage libdrm libcups expat libxcb dbus gcc-libs glib2 libxext libxkbcommon)
source=("${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('f35cd372a2fdfd941cc4e579aacc686ae9fe68cf59cf796dfc7219ad283b1859'
            '297c0933a1a353556fd9c7a7898209c1b25a8fa8c96d3268278f77c0498b5a04')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/scalable"
}