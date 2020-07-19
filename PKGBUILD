# Maintainer: star2000 <i@star2000.work>

pkgname=autoupgrade
pkgver=1.0.0
pkgrel=1
pkgdesc='Automatic snapshot and then upgrade the system. (When the system fails, run `sudo timeshift --restore` and remove this package until the problem is solved.)'
arch=('any')
url='https://github.com/star2000/autoupgrade'
license=('GPL')
install="$pkgname.install"
source=("$pkgname.service" "$pkgname.timer")
md5sums=('4c5f84c47a72cf3d79db5bf50034c5eb'
	'196f9bff2f5237e73dfdbc41fa44e13a')
depends=('timeshift-autosnap')
package() {
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/autoupgrade.service"
	install -Dm644 "$pkgname.timer" "$pkgdir/usr/lib/systemd/system/autoupgrade.timer"
}
