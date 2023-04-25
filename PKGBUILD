# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xpeviewer-bin
pkgver=0.04
pkgrel=2
pkgdesc="PE file viewer/editor for Windows, Linux and MacOS."
arch=(x86_64)
url="http://ntinfo.biz/"
_githuburl="https://github.com/horsicq/XPEViewer"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt5-base' 'hicolor-icon-theme')
provides=()
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu_22.04_amd64.deb"
       "LICENSE::${_githuburl}/raw/master/LICENSE" )
noextract=()
sha256sums=('9244a20b48c1ffa4be7d8d2714ff47f72a40bbecbd00ee6398754ed2e505f25c'
            '7fe712494db68b85f8288ef86d3faa21ef2fdacaef0f50170d92c014baa9eb79')
package() {
	bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
       install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}