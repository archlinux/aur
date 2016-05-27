# Maintainer: Flow

pkgname=xu4fanctl-git
_pkgname=xu4fanctl
pkgver=r6.e32d18a
pkgrel=1
pkgdesc="fan control daemon for odroid xu4"
arch=('armv7h')
conflicts=()
provides=()
url='https://github.com/L33thium/xu4fanctl'
license=('GPLv3')
depends=()
makedepends=('git')
source=('git+https://github.com/L33thium/xu4fanctl.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 fanctl.py ${pkgdir}/root/fanctl.py
    install -Dm644 fanctl.service ${pkgdir}/usr/lib/systemd/system/fanctl.service
}
