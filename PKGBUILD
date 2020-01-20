# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=2.2
pkgrel=1
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=(
	'nginx'
	'nmap'
)
source=("https://github.com/BKasin/Gogios/releases/download/${pkgver}/gogios_${pkgver}-${pkgrel}_amd64.deb")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('b182b942c9bf06a59fa76d86cdb8ae366d94d4dedeb80215506fdcda516f0075')
provides=('gogios')
conflicts=('gogios')

package() {
    bsdtar -O -xf gogios_${pkgver}-${pkgrel}_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
