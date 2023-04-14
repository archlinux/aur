pkgname=ramroot-btrfs
pkgver=2.1
pkgrel=1
_gitrepo=ramroot-btrfs
_gituser=K-arch27
_gitver=2.1
pkgdesc="Load root file system to zram during boot with btrfs support"
arch=('x86_64')
url="https://github.com/$_gituser/$_gitrepo"
license=('GPL3')
conflicts=('liveroot')
depends=('mkinitcpio')
install=ramroot.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz"
    ramroot.install)
md5sums=('b11d84c7162a746e1d44e72d73a6d152'
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
