pkgname=ant-bloody-gtk-theme
pkgver=1.3.0
pkgrel=5
pkgdesc="Ant Bloody Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://github.com/EliverLara/Ant-Bloody/releases/download/v1.3.0/Ant-Bloody.tar")
sha256sums=('1afd626d337e4641d0d108d4120bda9d53a6d63d86e70d4f90b8ca5f27283f67')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
