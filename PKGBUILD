# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='screens'
pkgver=120118
pkgrel=4
pkgdesc="A utility for taking and managing screenshots."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('unzip')
sha512sums=('102aa5fe9eae86ad7bce8683e9e8677293f40d783b0787620b59cee6a7ed48d1d312c343b70d0ae71aceb2bf0377c79f4df13c5c596d6b1d63e9604012d353c0')
provides=('screens')
conflicts=('screens')
source=('https://gitlab.com/davidbittner/Screens/-/jobs/128314331/artifacts/download.zip')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -m 777 screens*.out -T "${pkgdir}/usr/bin/screens"
    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
