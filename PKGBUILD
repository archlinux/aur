## Author: Mohammad Odeh <astronomycenter.net>
# Maintainer: dj.zak <dz.wbdev@gmail.com>
pkgname=mushaf_almadinah
pkgver=1
pkgrel=1
pkgdesc="مصحف المدينة."
arch=('x86_64')
url="https://nashrmaktabi.qurancomplex.gov.sa"
license=('custom')
depends=('wine' 'bash')
source=('mushaf_almadinah.tar.xz::https://github.com/dzwdev/mushaf_almadinah/raw/ad3c9412894f178eecbeff661e8dbc84f01c58c1/mushaf_almadinah.tar.xz')
sha256sums=('464423661e1e01b829d940692e5904e2d694436e3de6c0bf3174281025796daa')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/fonts/mushaf_fonts"
    mv "${srcdir}/mushaf_almadinah/"* "${pkgdir}/usr/share/${pkgname}/"
    mv "${srcdir}/fonts/"* "${pkgdir}/usr/share/fonts/mushaf_fonts"
    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
    install -Dm755 "${srcdir}/mushaf_almadinah.sh" "${pkgdir}/usr/bin/mushaf_almadinah.sh"
    install -Dm644 "${srcdir}/mushaf_almadinah.desktop" "${pkgdir}/usr/share/applications/mushaf_almadinah.desktop"
    }
