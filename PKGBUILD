# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Chester Wisniewski <chetw@zuzax.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>
# Contributor: tee <teeaur at duck dot com>

pkgname=invoiceplane
pkgver=1.6.3
pkgrel=1
pkgdesc='Self hosted invoicing for freelancers and small businesses'
arch=('any')
url='https://invoiceplane.com'
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
options=(!strip)
source=("${pkgname}-${pkgver}.zip::https://www.invoiceplane.org/download/v${pkgver}")
sha256sums=('4a3d7b9d10a785ccd5add44a230d95aad588848e10eed47969f0008f371b9f24')

package() {
    cd "${srcdir}"
    install -dm755 "ip" "${pkgdir}/usr/share/webapps/invoiceplane"
    install -Dm644 "ip/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a ip/* "${pkgdir}/usr/share/webapps/invoiceplane"
}
