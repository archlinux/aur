pkgname=osx-arc-shadow
pkgver=1.4.7
pkgrel=1
pkgdesc="OSX-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
md5sums=('f2d6d80833519059828dbbe6c60a130f')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1514574635/s/$_s/t/$_t/OSX-Arc-Shadow-v1.4.7.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
