# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>

pkgname=mobilesheets-companion
pkgver=4.1.7
pkgrel=1
pkgdesc='Companion app for MobileSheets to remotely manage sheet libraries.'
url='https://www.zubersoft.com/mobilesheets/companion/'
depends=('glibc')
makedepends=('dpkg')
source=("https://www.zubersoft.download/MobileSheetsCompanion.deb")
sha512sums=("SKIP")
arch=('x86_64')

pkgver() {
    dpkg-deb --show --showformat='${Version}' MobileSheetsCompanion.deb
}

package() {
    dpkg-deb -xv MobileSheetsCompanion.deb "${pkgdir}"
    # Fix up directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
