# Contributor: TeaHouseLab(aka. Tsingkwai) <tsingkwai at ruzh dot top>

pkgname=ctcontainer
pkgver=r3.11ee89c
pkgrel=2
pkgdesc="container manager which enable you to experience otherlinux distro with xorg/xwayland and pulseaudio support"
arch=("any")
url="https://github.com/kwaitsing/ctcontainer"
depends=("fish" "sudo" "util-linux" "xorg-xhost" "pulse-native-provider")
makedepends=("git")
license=("GPL-3.0-only")
source=(git+https://github.com/kwaitsing/ctcontainer.git)
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -Dm755 ${pkgname}/ctcontainer -t "${pkgdir}"/usr/bin/
}

