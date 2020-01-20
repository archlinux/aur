# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-plugins-bin
pkgver=2.2
pkgrel=1
pkgdesc="Plugins for the gogios checking system."
arch=('x86_64')
url="https://angrysysadmins.tech"
license=('MIT')
optdepends=(
	'nmap'
	'gogios'
)
source=("https://github.com/BKasin/gogios-plugins/releases/download/${pkgver}/gogios-plugins-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
options=('!strip' '!emptydirs')
noextract=("gogios-plugins-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
sha256sums=('504e6c72cf9b39c7dd59127e7f20641f0fb6a7d25fc98955be087503eaa26daf')
provides=('gogios-plugins')
conflicts=('gogios-plugins')

package() {
    tar -xf gogios-plugins-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C "${pkgdir}"
    rm "${pkgdir}"/{.MTREE,.PKGINFO}

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
