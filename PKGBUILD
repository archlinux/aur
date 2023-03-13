# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frappe-books-bin
_pkgname=frappe-books
pkgver=0.10.0
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
options=()
conflicts=(frappe-books)
depends=(alsa-lib gtk3 at-spi2-core nss)
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('39a096e11e0852008eb915ea756ec04c154cec384f0f6b425ed427ce09904cbcdb4a5892ebb7afd62ec6addfec724ca65475f6f79fd77b0c1b91a1b8c4588ad2')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    sed 's/Finance/Utility/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
