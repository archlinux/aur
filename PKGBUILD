# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname='organizr'
_pkgname='Organizr'
pkgver=1.9.0
_pkgver=1.90
pkgrel=1
pkgdesc='HTPC/HomeLab services organizer.'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite<7.3.0')
optdepends=('fail2ban')
provides=('organizr')
conflicts=('organizr-git')
install='organizr.install'
source=("${_pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/causefx/Organizr/archive/${_pkgver}.tar.gz" "organizr.install")
sha256sums=('18fb4b35c1e7721ef674bcc968762d8ee27c07684b9320cc6a5467eb04fd8d98'
	    'c4f08e6f1569ea9d82ae14bd5ec6cd5c0a8d762b52c7331bd75024092efaa390')

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
    install -dm 755 "${pkgdir}/var/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${_pkgver}/"* "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
}
