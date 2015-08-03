# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=invoiceplane
_pkgname=InvoicePlane
pkgver=1.4.3
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=(any)
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
optdepends=('php-mysql: for MySQL database support')
source=("https://github.com/InvoicePlane/InvoicePlane/archive/v1.4.3.tar.gz")
sha512sums=('5c8a5a646460c3cd7a6ac2ba58a4d44ec771509aa157a32f758d35acb90032f1fbc58caac7fa4823344ec74f682c9edbb9cb4f2481d161cfd40b88be59680b5c')

package() {
  cd ${srcdir}
  install -vdm0755 $pkgdir/usr/share/webapps
  mkdir -p $pkgdir/etc/webapps/invoiceplane
  cp -a "${_pkgname}-${pkgver}" ${pkgdir}/usr/share/webapps/invoiceplane
  ln -s /usr/share/webapps/invoiceplane/application/config $pkgdir/etc/webapps/invoiceplane

  install -D "${_pkgname}-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
