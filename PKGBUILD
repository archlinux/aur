# Maintainer: Prurigro

pkgname=cjdns-git-sysvinit
pkgver=20140626.r12.dda687c
pkgrel=1
pkgdesc="Legacy sysvinit (rc.d/init.d) service for the cjdns-git package"
url="https://github.com/prurigro/${pkgname}"
license=('GPL2')
arch=('any')
depends=('cjdns-git' 'bash')
makedepends=('git')
source=("git://github.com/prurigro/${pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 ${pkgname}/cjdns "${pkgdir}"/etc/default/cjdns
    install -Dm755 ${pkgname}/cjdns.sh "${pkgdir}"/usr/bin/cjdns.sh
    install -Dm755 ${pkgname}/cjdns.rc.d "${pkgdir}"/etc/rc.d/cjdns
}
