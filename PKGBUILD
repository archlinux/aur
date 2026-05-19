# Maintainer: Your Name <your@email.com>
pkgname=cups-djvu-printer
pkgver=1.0.0
pkgrel=1
pkgdesc="A virtual CUPS printer that saves documents as DjVu files in /var/spool/cups-pdf/\$USER"
arch=('any')
url="https://github.com/yourusername/cups-djvu-printer"
license=('GPL')
depends=('cups' 'djvulibre' 'ghostscript' 'gsdjvu')
install="${pkgname}.install"
source=("djvu-backend"
        "djvu-printer.ppd")
sha256sums=('cc990f3702bd4f7e44884c46d0efd5a0b3f549139d599f4f9d4b7e108484dd31'
            '194c9cfefffff8f58ca8c0486c3f96ab432b08728aced7fd7f790c77d2983d9e')

package() {
  # Install the CUPS backend
  install -Dm755 "${srcdir}/djvu-backend" "${pkgdir}/usr/lib/cups/backend/djvu"
  
  # Install the PPD file
  install -Dm644 "${srcdir}/djvu-printer.ppd" "${pkgdir}/usr/share/cups/model/djvu-printer.ppd"
}
