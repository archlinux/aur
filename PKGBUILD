# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=yana
pkgname="${_pkgname}-bin"
pkgver=1.0.13
pkgrel=2
epoch=
pkgdesc="Powerful note-taking app with nested documents, full-text search, rich-text editor, code snippet editor and more"
arch=("x86_64")
url="https://yana.js.org/"
_githuburl="https://github.com/lukasbach/yana"
license=(MIT)
depends=(gtk3 nss alsa-lib at-spi2-core pango glibc libcups dbus glib2 gcc-libs libxi libxcursor libxrandr gdk-pixbuf2 \
    libxcomposite hicolor-icon-theme libx11 libdrm expat libxrender cairo nspr mesa libxdamage libxfixes libxcb libxext libxtst)
options=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${_pkgname}-${pkgver}_amd64.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('d77ae4ea99b418b0e063f2e3ed0801144478ca5aadfe84732e4003390fca6ebf'
            'd51fa4278a4f3a6871df2e45a74a3a242f253b21e1ed655f7117d5dd45570a32')
     
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
