# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=asus-nb-wmi-reload
pkgname=asus-nb-wmi-reload-git
pkgver=20160126
pkgrel=1
pkgdesc="A systemd service for reload ASUS NB WMI Driver after resume"
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('GPL2')
depends=('bash' 'kmod' 'sudo' 'systemd')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
install="${_pkgname}.install"

pkgver() {
    cd ${srcdir}/${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
} 
