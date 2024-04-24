# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Maintainer: Chester Wisniewski <chetw@zuzax.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.6.1
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("${pkgname}-${pkgver}.zip::https://www.invoiceplane.org/download/v${pkgver}")
sha256sums=('ebabd7c44e294d432498f6a52e026b0adda997605258e277b622792b9c2ca586')

package() {
    cd ${srcdir}
    install -dm755 "ip" "${pkgdir}/usr/share/webapps/invoiceplane"
    rm "${pkgname}-${pkgver}.zip"
    install -Dm644 "ip/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a ip/* "${pkgdir}/usr/share/webapps/invoiceplane"
}
