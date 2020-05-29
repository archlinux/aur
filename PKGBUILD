# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Maintainer: Chester Wisniewski <chetw@zuzax.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.5.11
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("${pkgname}-${pkgver}.zip::https://www.invoiceplane.org/download/v${pkgver}")
sha256sums=('4de189ee5a0c8b57c075d9b6d48cf2ebbd8802c504fd57dc91634da26f07ef8c')

package() {
    cd ${srcdir}
    install -dm755 "${pkgdir}/usr/share/webapps/invoiceplane" 
    rm "${pkgname}-${pkgver}.zip"
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a * "${pkgdir}/usr/share/webapps/invoiceplane"
}
