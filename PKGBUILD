#Maintainer: Nudelsalat <nudelsalat@clouz.de>
pkgname=unihedron-device-manager
pkgver=1.0.0.240
pkgrel=1
pkgdesc='Unihedron Device Manager'
url=http://unihedron.com/projects/darksky/cd/
arch=('x86_64')
license=('GPL3')
source=(http://unihedron.com/projects/darksky/cd/Linux/udm_amd64_${pkgver}.deb)
sha256sums=('174d8ef8b402d1c655effd77995437715d3ccbe476cdab8a9bc1b3f3c4f2a5e0')
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
