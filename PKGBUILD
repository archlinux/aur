pkgname=ant-bloody-gtk-theme
pkgver=1.1.0
pkgrel=4
pkgdesc="Ant Bloody Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1518217181/s/$_s/t/$_t/u//Ant-Bloody.tar")
sha256sums=('5052a5289ad7f9cb35283cc9b9a6fa64987d11022de782747a232b7445fe114a')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
