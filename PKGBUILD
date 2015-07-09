# Maintainer: X0rg
# Contributor: Ybalrid <ybalrid@cecmu.org>

pkgname=systemd-numlockontty
pkgver=0.1
pkgrel=11
pkgdesc="Systemd service + script, automatically activate numpad on ttys"
arch=('any')
url='http://avalon.ybalrid.info/aur/numlockontty.html'
depends=('systemd')
replaces=('numlockontty')
license=('GPL')
install='numlockontty.install'
source=(http://avalon.ybalrid.info/aur/numlockontty-${pkgver}.tar.gz)
noextract=()
md5sums=('f7b69626dd83f5da5269b226688ff1b8')

package() {
    cd "$srcdir"
    install -Dm755 'numlockOnTty' "${pkgdir}/usr/bin/numlockOnTty" || return 1
    install -Dm644 'numLockOnTty.service' "${pkgdir}/usr/lib/systemd/system/numLockOnTty.service" || return 1

}
