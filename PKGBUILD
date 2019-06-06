#Maintainer: Nudelsalat <nudelsalat AT clouz DOT de>
pkgname=unihedron-device-manager
pkgver=1.0.0.217
pkgrel=2
pkgdesc='Unihedron Device Manager'
url=http://unihedron.com/projects/darksky/cd/
arch=('x86_64')
license=('GPL3')
source=(http://unihedron.com/projects/darksky/cd/Linux/udm_amd64_${pkgver}.deb)
sha256sums=('10121859acdc6dab6cc787182590eb1a84a419964ad6aa7104e7b1a2f518f21d')
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
