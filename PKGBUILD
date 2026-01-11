# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.6.0
pkgrel=1
pkgdesc="Notifies you on the desktop when booting into a read-only system or when BTRFS warning/error messages appear in the dmesg log."
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification"
license=('GPL3')
depends=('libnotify' 'systemd')
optdepends=('dunst')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "snapper-snapshot-notification-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('21e7bb2180a23eeb0b04ec2f8a6f155cfeabf30ff23489c89e62370a8aeffe12')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -dm 755 "usr/share/doc/${pkgname}/"
	cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
	cp -r usr etc "$pkgdir"
}
