# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=1.3
pkgrel=1
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=(
	'nginx'
	'nmap'
)
source=("https://github.com/BKasin/Gogios/releases/download/${pkgver}/gogios-${pkgver}.deb")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios-${pkgver}.deb")
sha256sums=('1f21c298c39e4d12155d1512a307443e836ba3e8731c339e05ec17abcbebc51d')
provides=('gogios')
conflicts=('gogios')

package() {
    bsdtar -O -xf gogios-${pkgver}.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

