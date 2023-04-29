# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=make-lvm-snapshot
pkgver=0.1.0
pkgrel=6
pkgdesc="Make a consistent LVM snapshot of the root volume"
arch=('any')
url="https://gitlab.com/Marcool04/$pkgname/"
license=('GPL')
depends=("lvm2" "bc")
install="$pkgname.install"
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('266ffe63100960d757ba549cf7a943b13a7e5eb3a5d4386333cb894343d1e805'
            '8fc5a679091d79b95d29743abfa5e45ea70647996eb1958ef8457323416d8ac2')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/systemd/system/"
	chmod +x make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh
	cp make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh "$pkgdir/usr/bin"
	cp monitor_lvm_snapshot_usage.service monitor_lvm_snapshot_usage.timer "$pkgdir/etc/systemd/system"
	cp make-lvm-snapshot.target make-lvm-snapshot.service "$pkgdir/etc/systemd/system"
}
