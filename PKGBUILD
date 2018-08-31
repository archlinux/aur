pkgname=ant-dracula-gtk-theme
pkgver=1.1.0
pkgrel=4
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1535090502/s/$_s/t/$_t/u//Ant-Dracula.tar")
sha256sums=('c854fe5316bda78e3ef429d07b77bd624767f9bc8922b010d1f526a5054c8334')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
