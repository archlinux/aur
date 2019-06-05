#Maintainer: Nudelsalat <nudelsalat AT clouz DOT de>
pkgname=unihedron-device-manager
pkgver=1.0.0.216
pkgrel=1
pkgdesc='Unihedron Device Manager'
url=http://unihedron.com/projects/darksky/cd/
arch=('x86_64')
license=('GPL3')
source=(http://unihedron.com/projects/darksky/cd/Linux/udm_amd64_${pkgver}.deb)
sha256sums=('79d3ec1adf74d13a2ec683ae644c71743e02688f4ac19a3d6129e54c10aedb4c')
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
