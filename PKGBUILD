# Maintainer: Nikhil Singh <nik.singh710@gmail.com>

pkgname=hyprland-scratchpad-git
pkgver=814e260
pkgrel=1
pkgdesc="A helper for scratchpads within Hyprland."
arch=("any")
url="https://github.com/hyprwm/contrib"
license=('MIT')
provides=('scratchpad')
conflicts=('scratchpad')
depends=("hyprland" "jq")
optdepends=('libnotify: Notify users on an action.')
makedepends=("git")
source=("git+https://github.com/hyprwm/contrib.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/contrib/scratchpad"
	git log --pretty="format:%h" -n 1 scratchpad | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/contrib/scratchpad"

	install -Dm 755 scratchpad "$pkgdir/usr/bin/scratchpad"
}
