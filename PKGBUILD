pkgname=ant-nebula-gtk-theme
pkgver=1.0.3
pkgrel=6
pkgdesc="Ant Nebula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
md5sums=('0cf0b7703c212901954b5b9b2111b402')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1515733790/s/$_s/t/$_t/Ant-Nebula.tar")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
