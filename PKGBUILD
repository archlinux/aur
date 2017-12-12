pkgname=ant-nebula-gtk-theme
pkgver=1.0.3
pkgrel=4
pkgdesc="Ant Nebula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
md5sums=('a18a71424b019043df3cf5243f515d36')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1511326981/s/$_s/t/$_t/Ant-Nebula.tar")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
