# Maintainer: James Armstrong <jm.armstrong1207@gmail.com>
pkgname=detect-tablet-mode-git
pkgver=r29.626e81c
pkgrel=1
pkgdesc="Detects both normal & tablet mode, executing custom scripts/commands for each mode. See the github page for instructions."
arch=("any")
url="https://github.com/alesguzik/linux_detect_tablet_mode"
license=("MIT")
groups=()
depends=("ruby" "libinput")
makedepends=("git")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("$pkgname::git+$url")
noextract=()
sha256sums=("SKIP")

pkgver()
{
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $pkgname

	install -d $pkgdir/usr/bin
	install -d $pkgdir/etc/

	cp watch_tablet $pkgdir/usr/bin
	cp watch_tablet.yml $pkgdir/etc/watch_tablet.yml.example
}
