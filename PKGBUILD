# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=1.1
pkgrel=1
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=('nginx')
source=("https://github.com/BKasin/Gogios/releases/download/${pkgver}/gogios-${pkgver}.deb")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios-${pkgver}.deb")
sha256sums=('2695f0750522d5730fcdd31193151dfde0dc22483b59772fdab07003947022fd')

package() {
    bsdtar -O -xf gogios-${pkgver}.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

