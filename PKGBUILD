# Maintainer: noel <nowl.bru@gmail.com>

pkgname=kyocera-fs11001300d
pkgver=8.4
pkgrel=2
pkgdesc='PPD drivers for Kyocera FS1100 and FS1300D printers'
arch=('any')
url='http://www.kyoceradocumentsolutions.de/index/serviceworld/downloadcenter.false._.FS1300D._.DE.html#'
license=('custom')
depends=('cups' 'avahi')
optdepends=()
makedepends=()
conflicts=()
install="$pkgname.install"
source=('http://cdn.kyostatics.net/dlc/de/driver/all/linux_ppds_fs11001300.-downloadcenteritem-Single-File.downloadcenteritem.tmp/Linux_PPDs_FS11001300.zip'
        'license.txt')
noextract=()
sha256sums=('108381209090f403d6d9788786129206729fc21d543d9937ba9c938245e13bd9'
            '8e6e7fff0e0b49c0d53c6949ca1cb37b1e5e6bb2651ab1ed9f4d6ee051e4d8bf')
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry 3 -O %o %u')
# Valid options are: English, French, German, Italian, Portuguese, Spanish
_language='English'

package() {
    # Set language name: Default is English

    # Installing the license, copied from the download site
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt

    # Install 1100 and 1300D PPDs
    install -dm755 ${pkgdir}/usr/share/cups/model/Kyocera
    install -m644 ${srcdir}/Linux/${_language}/*.[pP][pP][dD] ${pkgdir}/usr/share/cups/model/Kyocera
}

# vim:set ts=2 sw=2 et:
