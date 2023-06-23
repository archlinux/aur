# Maintainer: Nikhil Singh <nik.singh710@gmail.com>

pkgname=hyprland-scratchpad-git
pkgver=r51.93b6aba
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/contrib/scratchpad"

	install -Dm 755 scratchpad "$pkgdir/usr/bin/scratchpad"
}
