# Maintainer: jjacky
pkgname=auto-rsync-backups
pkgver=1.1.0
pkgrel=1
pkgdesc="little script to handle/rotate rsync backups"
arch=('any')
url="https://github.com/jjk-jacky/auto-rsync-backups"
license=('GPL3')
depends=('bash' 'rsync')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('2f72124fd20cd20967ea3053b6c3c2fc2e3f914d')

package() {
    cd $pkgname-$pkgver
    for f in auto-rsync-{backups,restore}.sh auto-rsync-backups.common; do
        install -D -m755 $f "${pkgdir}/usr/bin/$f"
    done
    for f in backups.{sample.conf,excludes} AUTHORS COPYING HISTORY LICENSE README.md; do
        install -D -m644 $f "${pkgdir}/usr/share/${pkgname}/$f"
    done
}
