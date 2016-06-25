### Arch_Linux PKGBUILD for fluxable-newmenu
## Maintainer: B.H. <es_vinux@vinuxproject.org>
## Contributer StormDragon <stormdragon2976@gmail.com>

pkgname=ran-git
_pkgname=ran
pkgver=6.f67d3cc 
pkgrel=3
pkgdesc="record audio notes: a front end for sox written in bash"
arch=('any')
url="https://github.com/burt1iband/ran"
license=('GPL')
source=("git+${url}.git")
depends=('bash' 'bc' 'sox')
optdepends=('bash-completion' 'notification-daemon' 'fluxable-newmenu' 'orca' 'speakup')
makedepends=('git')
provides=('ran')
conflicts=('ran')
install=${_pkgname}.install
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
 
package() {
cd "${srcdir}/${_pkgname}"
     install -d "$pkgdir/usr/bin"
     install -m 755 $_pkgname $pkgdir/usr/bin/
     install -d "$pkgdir/etc/fluxable"
          install -m 644 fluxable.conf.org ${pkgdir}/etc/fluxable/
     install -d "$pkgdir/usr/share/doc/ran"
          install -m 644 change.log $pkgdir/usr/share/doc/ran/
     install -d "$pkgdir/usr/share/man/man1"
          install -m 644 ran.1.gz $pkgdir/usr/share/man/man1/
}
