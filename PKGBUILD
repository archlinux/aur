# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.6.3
pkgrel=2
pkgdesc="Notifies you on the desktop when booting into a read-only system or when BTRFS warning/error messages appear in the dmesg log."
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification"
license=('GPL3')
depends=('libnotify' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('a9faeecf8d29f45bd835c409037d97a2f2c19c9c5985965e6c50c2bc207c8663')

package() {
	cd "$srcdir/${pkgname}"
	install -dm 755 "$pkgdir/usr/share/doc/${pkgname}/"
	install -Dm 644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname}/"
	cp -a usr etc "$pkgdir"
}
