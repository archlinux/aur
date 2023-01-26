pkgname="speedrun"
pkgver=0.1.0
pkgrel=1
arch=("any")
url="https://github.com/zeroxoneafour/speedrun"
pkgdesc="Run your games extra fast with speedrun"
license=("MIT")
optdepends=("mangohud: mangohud support" "gamemode: gamemoderun support" "nvidia-prime: prime-run support")
source=("$pkgname::git+https://github.com/zeroxoneafour/speedrun")
sha256sums=("SKIP")
install=".install"

pkgver() {
	cd $pkgname
	echo $(grep -Po "version=\d+\.\d+\.\d+" speedrun.sh | grep -Po "\d+\.\d+\.\d+")
}

package() {
	cd $pkgname
	install -D -m755 "speedrun.sh" "$pkgdir/usr/bin/speedrun"
	install -D -m755 "speedrun.conf" "$pkgdir/etc/speedrun.conf"
}
