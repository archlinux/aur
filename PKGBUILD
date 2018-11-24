# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='screens'
pkgver=200818
pkgrel=3
pkgdesc="A utility for taking and managing screenshots."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('unzip')
sha512sums=('44e6f2c43e97ca88f75a2a00f59d0bcefef4af4da3bb3779fa70e430897e9b505d31b1954545524a637e8ff15218d4de7cd3cd0700ced7600463162f03107192')
provides=('screens')
conflicts=('screens')
source=('https://gitlab.com/davidbittner/Screens/-/jobs/125022991/artifacts/download')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -m 777 screens*.out -T "${pkgdir}/usr/bin/screens"
    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
