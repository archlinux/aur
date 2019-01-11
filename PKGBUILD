# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
pkgname='organizr-git'
_pkgname='organizr'
pkgver=r1556.4c51e50
pkgrel=1
pkgdesc='HTPC/HomeLab services organizer (git version).'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite')
optdepends=('fail2ban')
provides=('organizr')
conflicts=('organizr')
install='organizr.install'
source=("${pkgname}::git+https://github.com/causefx/Organizr.git#branch=v2-develop" "organizr.install")
sha256sums=('SKIP'
	    'c4f08e6f1569ea9d82ae14bd5ec6cd5c0a8d762b52c7331bd75024092efaa390')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${_pkgname}/Organizr"
    install -dm 755 "${pkgdir}/var/lib/${_pkgname}"
    cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/usr/share/webapps/${_pkgname}/Organizr"
}
