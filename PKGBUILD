# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.6.2
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
sha256sums=('f38a939cb629394ec510abf7b4fd65417cca2523ae856fa566fa25c096ceb82f')

package() {
	cd "$srcdir/${pkgname}"
	install -dm 755 "usr/share/doc/${pkgname}/"
	cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
	cp -r usr etc "$pkgdir"
}
