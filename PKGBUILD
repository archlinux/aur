# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
_basename='hyprshot'
pkgname="$_basename-git"
pkgver=1.0.1.r0.5c6d0cd
pkgrel=1
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
url="https://github.com/Gustash/hyprshot"
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://github.com/Gustash/hyprshot.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_basename"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/$_basename"
    mkdir -p "$pkgdir/usr/bin"
    cp hyprshot "$pkgdir/usr/bin/"
}
