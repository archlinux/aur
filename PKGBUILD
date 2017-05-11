# Maintainer: chet <chetgurevitch @ protonmail . com>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: seishinryohosha <seishinryohosha @ gmail . com>
# Contributor: even <kessiapinheiro @ gmail . com>

pkgname=greenfoot
pkgver=3.1.0
pkgrel=2
pkgdesc="Allows easy development of two-dimensional graphical applications, such as simulations and interactive games."
arch=('any')
url="http://www.greenfoot.org"
license=('GPL2')
depends=('sh' 'java-runtime' 'java-environment' 'java-openjfx')
makedepends=('libarchive')
source=(http://www.greenfoot.org/download/files/Greenfoot-linux-${pkgver//.}.deb
        greenfoot)
sha256sums=('edf1e727386217a299e9fcd57a6d5c60a724a811d90d7ddec5fa05cc28631695'
            'fdca5b8433e10ca99cf91c2ab863f86e740bd08a82532e01a49ba8110a15481e')

package() {
cd "$srcdir"
ar p Greenfoot-linux-${pkgver//.}.deb data.tar.xz | tar xJ

mkdir -p "${pkgdir}/usr/share/${pkgname}"
mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

cp -r usr/share/icons "${pkgdir}/usr/share"
cp -r usr/share/greenfoot "${pkgdir}/usr/share/java"
cp -r usr/share/doc/Greenfoot/API "${pkgdir}/usr/share/${pkgname}"
cp -r usr/share/doc/Greenfoot/scenarios "${pkgdir}/usr/share/doc/${pkgname}"
install -Dm644 usr/share/doc/Greenfoot/README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
install -Dm644 usr/share/doc/Greenfoot/GREENFOOT_LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/GREENFOOT_LICENSES"
install -Dm644 usr/share/doc/Greenfoot/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -Dm644 usr/share/doc/Greenfoot/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
install -Dm644 usr/share/applications/greenfoot.desktop "${pkgdir}/usr/share/applications/greenfoot.desktop"
install -Dm755 greenfoot "${pkgdir}/usr/bin/greenfoot"
}
