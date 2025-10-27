# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>
pkgname=epicenter-whispering-bin
pkgver=7.5.5
pkgrel=1
pkgdesc="Local-first AI voice notebook for capturing and refining spoken thoughts"
arch=('x86_64')
url="https://github.com/epicenter-md/epicenter"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('epicenter-whispering')
conflicts=('epicenter-whispering')
source=("${pkgname}-${pkgver}.deb::https://github.com/epicenter-md/epicenter/releases/download/v${pkgver}/Whispering_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    # Extract the .deb package
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    
    # Fix permissions
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    
    if [ -d "${pkgdir}/usr/bin" ]; then
        find "${pkgdir}/usr/bin" -type f -exec chmod 755 {} \;
    fi
}