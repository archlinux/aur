# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=ramroot
pkgver=2.0.2
pkgrel=1
_gitrepo=ramroot
_gituser=arcmags
_gitver=2.0.2
pkgdesc="Load root file system to zram during boot"
arch=('x86_64')
url="https://github.com/$_gituser/$_gitrepo"
license=('GPL3')
conflicts=('liveroot')
depends=('mkinitcpio')
install=ramroot.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz"
    ramroot.install)
md5sums=('0a70ecc2ea9f4700e20ee0fe56c07992'
         'cd9b4ef8c10a6eafead22453f8cf4ec0')

package() {
	cd "$pkgname-$pkgver"
    install -D -m644 usr/lib/initcpio/hooks/ramroot \
        "$pkgdir/usr/lib/initcpio/hooks/ramroot"
    install -D -m644 usr/lib/initcpio/install/ramroot \
        "$pkgdir/usr/lib/initcpio/install/ramroot"
    install -D -m644 usr/lib/ramroot/ramroot.conf \
        "$pkgdir/usr/lib/ramroot/ramroot.conf"
    install -D -m644 usr/lib/ramroot/ramroot.conf \
        "$pkgdir/etc/ramroot.conf"
    install -D -m644 usr/lib/ramroot/ramroot.z/etc/issue \
        "$pkgdir/etc/ramroot.z/etc/issue"
    install -D -m644 usr/share/man/man8/ramroot.8 \
        "$pkgdir/usr/share/man/man8/ramroot.8"
    install -D -m644 usr/share/man/man5/ramroot.conf.5 \
        "$pkgdir/usr/share/man/man5/ramroot.conf.5"
    install -D -m755 ramroot "$pkgdir/usr/bin/ramroot"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ramroot/LICENSE"
}
