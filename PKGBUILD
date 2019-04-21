# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=1.2
pkgrel=5
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=('nginx')
source=("https://github.com/BKasin/Gogios/releases/download/v${pkgver}/gogios-${pkgver}.deb")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios-${pkgver}.deb")
sha256sums=('d0c81333c952ec507802d9a1e36cf3ce9d071a18e09a1d3f158dcd2108c8bc6e')

package() {
    bsdtar -O -xf gogios-${pkgver}.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

