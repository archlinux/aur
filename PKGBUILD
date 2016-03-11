# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=snap-pac
pkgver=0.1.2
pkgrel=1
pkgdesc="Make pacman automatically use snapper to create pre/post snapshots like openSUSE's YaST"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('LGPL')
depends=(snapper)
source=(${url}/archive/${pkgver}.tar.gz
        snap-pac.install)
install="snap-pac.install"
md5sums=('1c72f8e0d5ccc61ab4e14907346af282'
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
