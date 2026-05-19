# Maintainer: Your Name <your@email.com>
pkgname=cups-djvu-printer
pkgver=1.0.0
pkgrel=7
pkgdesc="A virtual CUPS printer that saves documents as DjVu files in /var/spool/cups-pdf/\$USER"
arch=('any')
url=""
license=('GPL')
depends=('cups' 'djvulibre' 'ghostscript' 'gsdjvu')
install="${pkgname}.install"
source=("djvu-backend"
        "djvu-printer.ppd")
sha256sums=('5407e4e539ebaee55f8f9fd6f42918d43148362972b7991931020b9f28e66960'
            '194c9cfefffff8f58ca8c0486c3f96ab432b08728aced7fd7f790c77d2983d9e')

package() {
  # Install the CUPS backend
  install -Dm700 "${srcdir}/djvu-backend" "${pkgdir}/usr/lib/cups/backend/djvu"
  
  # Install the PPD file
  install -Dm644 "${srcdir}/djvu-printer.ppd" "${pkgdir}/usr/share/cups/model/djvu-printer.ppd"
}
