# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=1.3
pkgrel=6
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=('nginx')
source=("https://github.com/BKasin/Gogios/releases/download/v${pkgver}/gogios-${pkgver}.deb")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios-${pkgver}.deb")
sha256sums=('d79d4489f82a90713f93cf2ab421dfa1df557be17e71a6ebaa0e93fb9917e4d0')

package() {
    bsdtar -O -xf gogios-${pkgver}.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

