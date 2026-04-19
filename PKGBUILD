# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-kde-theme-git
_pkgname=Sweet-kde
pkgver=r50.0feee61
pkgrel=1
pkgdesc="Sweet KDE Plasma theme"
arch=('any')
url="https://github.com/Gigas002/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=(
	'git'
)
depends=(
	'candy-icons-git'
)
optdepends=(
	'cantarell-fonts: tertiary font face defined'
	'beautyline: alternative icons set'
	'sweet-cursors-git: KDE cursors'
	'sweet-kvantum-git: kvantum theme'
	'sweet-konsole-git: konsole theme'
	'sweet-sddm-git: sddm theme'
	'sweet-folders-git: folder icons'
)
conflicts=(
	'plasma5-themes-sweet-kde-git'
	'plasma5-themes-sweet-full-git'
)
source=("$_pkgname::git+$url.git#branch=plasma-6-migration")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm755 "$pkgdir/usr/share"

	# KDE Plasma components
	cp -r "$srcdir/$_pkgname/aurorae" "$pkgdir/usr/share/aurorae"
	cp -r "$srcdir/$_pkgname/color-schemes" "$pkgdir/usr/share/color-schemes"

	# look-and-feel and desktoptheme
	cp -r "$srcdir/$_pkgname/plasma" "$pkgdir/usr/share/plasma"
}
