# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=1.01
pkgrel=3
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
depends=(
    'dotnet-sdk'
    'dotnet-runtime'
    'dotnet-host'
)
optdepends=('nginx')
source=("https://github.com/BKasin/Gogios/releases/download/v${pkgver}/gogios-${pkgver}.deb")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios-${pkgver}.deb")
sha256sums=('bb68599dd82ba408f553107f305ce0486fda35d1755c061111182a49e2fa8a08')

package() {
    bsdtar -O -xf gogios-${pkgver}.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

