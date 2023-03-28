# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=frappe-books
pkgname="${_pkgname}-bin"
pkgver=0.11.0
pkgrel=2
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
conflicts=("${_pkgname}-appimage")
depends=(alsa-lib gtk3 at-spi2-core nss glibc libx11 libcups pango libdrm libxext libxrandr nspr glib2 libxcomposite \
    mesa libxcb gcc-libs dbus expat libxdamage libxfixes libxkbcommon hicolor-icon-theme cairo)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('64770914045c7316298d0730ee6615121f9888bb7c0f15b51d69cec0bbc9107b')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    sed 's/Finance/Utility/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}