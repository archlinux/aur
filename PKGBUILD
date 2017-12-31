pkgname=osx-arc-darker
pkgver=1.4.7
pkgrel=1
pkgdesc="OSX-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
md5sums=('016779984cb10e802f273b5d03611afe')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1514574621/s/$_s/t/$_t/OSX-Arc-Darker-v1.4.7.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
