# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=(
	'nginx'
	'gogios-plugins'
)
source=("https://github.com/BKasin/gogios/releases/download/${pkgver}/gogios-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
options=('!strip' '!emptydirs')
install=${pkgname}.install
noextract=("gogios-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
sha256sums=('521125ed75fb3b27b41298a7871bbe512d70e07ecc0fb3b813e62c1b85bf2293')
provides=('gogios')
conflicts=('gogios')

package() {
    tar -xf gogios-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C "${pkgdir}"
    rm "${pkgdir}"/{.MTREE,.PKGINFO,.INSTALL}

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
