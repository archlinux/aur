# Maintainer: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>
# Maintainer: redtide <redtid3@gmail.com>

pkgname=xairedit
pkgver=1.6
pkgrel=1
pkgdesc="Remote control program for Behringer X-AIR mixers"
arch=('x86_64' 'aarch64')
url="https://www.behringer.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
source=("https://eurocom.musictribe.com/assets/EULA_2012-09-12.pdf"
        "xairedit.desktop")
source_x86_64=("https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_LINUX_${pkgver}.tar.gz")
source_armv7h=("https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_RASPI_${pkgver}.tar.gz")
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            'b57f9fcfe157cd880104948834c88a2983a1d12ee0ab7786737a281178fe4ed7')
sha256sums_x86_64=('8eac387f03fb38dc11b36422cdca997d7a8881849fcd2b452579a82756aaeff9')
sha256sums_armv7h=('0482654e3544286732c5ca5a8445913c98d488b586e066f00e0d4ac3f5ef36bd')

package()
{
    cd "${srcdir}"
    install -Dm755 X-AIR-Edit ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/${pkgname}/license.pdf
    install -Dm644 xairedit.desktop -t "${pkgdir}"/usr/share/applications
    install -Dm644 X-AIR-Edit_icon.png "${pkgdir}"/usr/share/pixmaps/xairedit.png
}
