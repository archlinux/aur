# Maintainer: Bumsik Kim <www@teaper.dev>

pkgname=virtscreen-appimage
_pkgname=virtscreen
pkgver=0.3.2
pkgrel=1
pkgdesc="Make your iPad/tablet/computer as a secondary monitor on Linux"
arch=("x86_64")
url="https://github.com/teaper/VirtScreen"
license=('GPL')
depends=('python-quamash')
optdepends=('arandr: for display settings option')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!strip)
_filename=VirtScreen-${pkgver}.AppImage
source=(
    "${url}/releases/download/${pkgver}/${_filename}"
    "virtscreen.desktop"
    "virtscreen.png"
    "virtscreen.sh")
    
md5sums=('120dcf15928164a7d26ef8df277a5595'
         'd256d8e2895b7c5bfe25fc9cde36542c'
         '66c72803b1d60d5b5ab1bb1118396085'
         '78ebf72e1a6b79fe42d50614697afaf6')

package() { 
    cd "${srcdir}"
    install -Dm755 "${_filename}" "${pkgdir}/opt/VirtScreen/${_pkgname}.AppImage"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
