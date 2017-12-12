pkgname=osx-arc-darker
pkgver=1.4.5
pkgrel=3
pkgdesc="OSX-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
md5sums=('458db52fd5a425a58407745e0a9e50fc')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1511459151/s/$_s/t/$_t/OSX-Arc-Darker-v1.4.5.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
