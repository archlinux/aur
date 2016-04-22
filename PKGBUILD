# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=bumblebeed-resume
pkgname=bumblebeed-resume-git
pkgver=20160422
pkgrel=1
pkgdesc="Simple systemd service for restart bumblebeed service after resume"
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('GPL2')
depends=('bash' 'bumblebee' 'coreutils' 'systemd')
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
