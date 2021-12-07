# Maintainer: Joey Miller <maintainer at joeeey dot com>

pkgname=eversticky
pkgver=0.95.2
pkgrel=1
pkgdesc="A sticky note client that sync to Evernote."
arch=('x86_64')
url="https://eversticky.joeeey.com"
license=('GPL3' 'MIT')
depends=("qt5-webengine>=5.12.2" "qt5-x11extras>=5.12.2" )
conflicts=("eversticky")
replaces=("eversticky")
source=("https://github.com/itsmejoeeey/eversticky/releases/download/v${pkgver}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('dc77765df293dedb60711a96128e7c04292c3f95d0cb28bff6b423e5f6e1d497')

package() {
    echo "  -> Extracting the installer..."

    # Extract binary and icons from data.tar.xz
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    # Extract license information from control.tar.xz
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    bsdtar -xf control.tar.xz -C "${pkgdir}/usr/share/licenses/${pkgname}" ./copyright
    mv "${pkgdir}/usr/share/licenses/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
