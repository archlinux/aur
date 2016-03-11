# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=snap-pac
pkgver=0.1
pkgrel=1
pkgdesc="Hooks and scripts for automating snapper snapshots on pacman transactions"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('LGPL')
depends=(snapper)
source=(${url}/archive/${pkgver}.tar.gz
        snap-pac.install)
install="snap-pac.install"
md5sums=('90a6687f9c070111cb256947f593f43f'
         'f830e3edf41a94a012fc2877f07acdfb')

package() {
    cd "$pkgname-$pkgver"
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/libalpm/hooks
    install -D snapper-pac-post $pkgdir/usr/bin/
    install -D snapper-pac-pre $pkgdir/usr/bin/
    install -D snapper-pre.hook $pkgdir/usr/share/libalpm/hooks/
    install -D snapper-post.hook $pkgdir/usr/share/libalpm/hooks/
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
