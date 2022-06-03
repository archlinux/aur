# Maintainer: Joey Miller <maintainer at joeeey dot com>

pkgname=eversticky
pkgver=0.96.0
pkgrel=1
pkgdesc="A sticky note client that sync to Evernote."
arch=('x86_64')
url="https://eversticky.joeeey.com"
license=('GPL3' 'MIT')
depends=("qt5-webengine>=5.12.2" "qt5-x11extras>=5.12.2" )
conflicts=("eversticky")
replaces=("eversticky")
source=("https://github.com/itsmejoeeey/eversticky/releases/download/v${pkgver}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('19499ff0c40eef9e1f6284b7ae1b6f330b9396bb6d47fb4de248f8883b744932')

package() {
    echo "  -> Extracting the installer..."

    # Extract binary and icons from data.tar.xz
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    # Extract license information from control.tar.xz
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    bsdtar -xf control.tar.xz -C "${pkgdir}/usr/share/licenses/${pkgname}" ./copyright
    mv "${pkgdir}/usr/share/licenses/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
