pkgname=cloudshell-lcd
_pkgname=cloudshell_lcd
pkgver=r21.1fd2a58
pkgrel=1
pkgdesc="LCD screen for odroid xu4"
arch=('armv7h')
conflicts=()
provides=()
url='https://github.com/MrKyr/cloudshell_lcd.git'
license=('GPLv3')
depends=('bc' 'curl' 'sysstat' 'procps-ng')
makedepends=('git')
source=('git+https://github.com/MrKyr/cloudshell_lcd.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 cloudshell ${pkgdir}/usr/bin/cloudshell
    install -Dm644 cloudshell.service ${pkgdir}/usr/lib/systemd/system/cloudshell.service
}
