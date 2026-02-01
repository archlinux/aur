# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.6.0
pkgrel=2
pkgdesc="Notifies you on the desktop when booting into a read-only system or when BTRFS warning/error messages appear in the dmesg log."
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification"
license=('GPL3')
depends=('libnotify' 'systemd')
optdepends=('dunst')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('7e2619adeeea8078713852a6b0cbddaf734953b1e2a3f3b038ba1e79457486fe')

package() {
	cd "$srcdir/${pkgname}"
	install -dm 755 "usr/share/doc/${pkgname}/"
	cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
	cp -r usr etc "$pkgdir"
}
