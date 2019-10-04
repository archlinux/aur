# Maintainer: Denis Sheremet <feedback-from-aur@lxlz.space>
pkgname=kmswpc-git
pkgver=r2.4d87e4a
pkgrel=1
pkgdesc="KDE-multiscreen-wallpaper-cutter: a Bash script to split an image according to current monitors setup."
arch=('any')
url="https://github.com/tharrrk/KDE-multiscreen-wallpaper-cutter"
license=('APACHE')
groups=()
depends=('xorg-xrandr' 'imagemagick')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/tharrrk/KDE-multiscreen-wallpaper-cutter")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -DT "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
