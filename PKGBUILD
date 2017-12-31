pkgname=osx-arc-plus
pkgver=1.4.7
pkgrel=1
pkgdesc="OSX-Arc-Plus Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
makedepends=('unzip')
md5sums=('49ee59c5017c1511051d61bb42acee67')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1514574576/s/$_s/t/$_t/OSX-Arc-Plus-v1.4.7.zip")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
