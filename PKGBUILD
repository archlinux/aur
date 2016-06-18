### Arch_Linux PKGBUILD for fluxable-newmenu
## Maintainer: B.H. <es_vinux@vinuxproject.org>
## Contributor StormDragon <stormdragon2976@gmail.com>
pkgname=fluxable-newmenu
_pkgname=fluxable-newmenu
pkgver=0.5.5.2
pkgrel=2
pkgdesc="provides categorized apps menus similar to those found in Mate or XFCE"
arch=('any')
url="https://github.com/burt1iband/fluxable-newmenu"
license=('GPL')
source=("git+${url}.git")
depends=('bash' 'grep' 'xorg-xrandr')
optdepends=('notification-daemon' 'caja' 'pcmanfm' 'nautilus' 'orca')
provides=('fluxable-newmenu' 'monitor-toggle')
conflicts=('fluxable-newmenu')
install=$pkgname.install
md5sums=('SKIP')

package() {
cd "${srcdir}/${_pkgname}"
     install -d "$pkgdir/usr/bin"
     install -m 755 $_pkgname $pkgdir/usr/bin/
     install -m 755 monitor-toggle $pkgdir/usr/bin/
     install -d "$pkgdir/usr/share/applications"
          install -m 644 fluxable-newmenu.desktop "$pkgdir/usr/share/applications/"
     install -d "$pkgdir/usr/share/doc/fluxable-newmenu"
          install -m 644 change.log ${pkgdir}/usr/share/doc/fluxable-newmenu
          install -m 644 fluxable.conf.org ${pkgdir}/usr/share/doc/fluxable-newmenu
     install -d "$pkgdir/usr/share/man/man1"
          install -m 644 fluxable-newmenu.1.gz $pkgdir/usr/share/man/man1/
     install -d "$pkgdir/etc/fluxable"
}
