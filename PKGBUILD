#Maintainer: Nudelsalat <nudelsalat@clouz.de>
pkgname=unihedron-device-manager
pkgver=1.0.0.253
pkgrel=1
pkgdesc='Unihedron Device Manager'
url=http://unihedron.com/projects/darksky/cd/
arch=('x86_64')
license=('GPL3')
source=(http://unihedron.com/projects/darksky/cd/Linux/udm_amd64_${pkgver}.deb)
sha256sums=('9c05b7daefd8682eee0d56aa44f04ecbaf515a236c3fbce341f28d6d80453af9')
depends=('gtk2' 'libglvnd')


package() {
    cd "${srcdir}"

    # Extract programm files
    tar -xf data.tar.xz -C "${pkgdir}"

    # Fix permissions
    chown -R root:root "${pkgdir}"
    chmod -R g-w "${pkgdir}"
    chmod -R u-s "${pkgdir}"
    chmod -R g-s "${pkgdir}"
}
