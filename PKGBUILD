# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
_pkgname=InvoicePlane
pkgver=1.4.6
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=(any)
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("https://github.com/InvoicePlane/InvoicePlane/archive/v1.4.6.tar.gz")
sha512sums=('6bd57bb0ec2c5d04e0ac815bd1da75c175bf50597d5dae7b3b04f8eecd1035f65217e09c56114e930df2219f478df3bea11546ab2003e80d405739bf5f29c9d3')

package() {
    install -d "$pkgdir"/usr/share/webapps
    install -d "$pkgdir"/etc/webapps/invoiceplane
    cp -a "$_pkgname-$pkgver" "$pkgdir"/usr/share/webapps/invoiceplane
    ln -fs /etc/webapps/invoiceplane/database.php "$pkgdir"/usr/share/webapps/invoiceplane/application/config/database.php

    install -Dm644 "$_pkgname-$pkgver"/license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}