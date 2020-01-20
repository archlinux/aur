# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-bin
pkgver=2.2
pkgrel=2
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
sha256sums=('0e47c0b67d69d12b82e101b55b98717f1c1eb50640d35da2071160a69375a5ee')
provides=('gogios')
conflicts=('gogios')

package() {
    tar -xf gogios-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C "${pkgdir}"
    rm "${pkgdir}"/{.MTREE,.PKGINFO,.INSTALL}

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
