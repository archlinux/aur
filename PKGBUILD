# Maintainer: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>
# Maintainer: redtide <redtid3@gmail.com>

pkgname=xairedit
pkgver=1.5
pkgrel=3
pkgdesc="Remote control program for Behringer X-AIR mixers"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.behringer.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
source=("https://eurocom.musictribe.com/assets/EULA_2012-09-12.pdf"
        "xairedit.desktop"
        "x-air-edit.png")
source_i686=("https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_LINUX_V${pkgver}.tar.gz")
source_x86_64=("https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_LINUX_X64_V${pkgver}.tar.gz")
source_armv7h=("https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_RASPI_V${pkgver}.tar.gz")
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            '41320beaeb7f6c50270481eac17866e942f2f4e0853f63d477d2e45e8c8fd49b'
            '9f52ae75d8826890448dcac1be09dcb9f7e01d1feba46c2dfaf2e6150f2d4b58')
sha256sums_i686=('0e6be5513505c725ac38a7febaf80e4e140cce7161609dd90ca203c0827362bc')
sha256sums_x86_64=('3733b829ed07319f786add8654619e70bc9e7bbcad41b6d11bf6cd93e5ffe3c5')
sha256sums_armv7h=('6c7b7626a478b49b33705f6c2d247da1a93e4782fc115a67d33aa75264d7b914')

package()
{
    cd "${srcdir}"
    install -Dm755 X-AIR-Edit -t ${pkgdir}/usr/bin/
    install -Dm644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/${pkgname}/license.pdf
    install -Dm644 xairedit.desktop -t "${pkgdir}"/usr/share/applications
    install -Dm644 x-air-edit.png -t "${pkgdir}"/usr/share/pixmaps
}
