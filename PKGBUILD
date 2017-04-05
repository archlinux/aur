# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
pkgname='organizr'
_pkgname='Organizr'
pkgver=1.29
pkgrel=1
pkgdesc='HTPC/HomeLab services organizer.'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite')
optdepends=('fail2ban')
install='organizr.install'
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/causefx/Organizr/archive/${pkgver}.tar.gz" "organizr.install")
sha256sums=('01f0b3b6602600738473d4d4c597fd8f7a22a67b01c4b5e5d42107c389004a0e'
            '75a1a4663fe4d628d88f3ce5f9c9e95761d3f6cfdc753f04d4b9d0e9c57c1735')

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
    install -dm 755 "${pkgdir}/var/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
}
