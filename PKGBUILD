# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frappe-books-bin
_pkgname=frappe-books
pkgver=0.11.0
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
options=()
conflicts=(frappe-books)
depends=(alsa-lib gtk3 at-spi2-core nss)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('49ba1db3e7d04de641a35a3c4dfcddf46e153b0424d91136209795d9a411a6159a7a2b70aed43f0068cb500641d3967123e1502263fa4a4171090bebc253d13d')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    sed 's/Finance/Utility/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
