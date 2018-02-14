pkgname=ant-gtk-theme
pkgver=1.1.0
pkgrel=4
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856

depends=('gtk3')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1518217160/s/$_s/t/$_t/u//Ant.tar")
sha256sums=('34cd4ae0d5adba03ba86ff9da08d67f415b8cab3be57122dacb110b25d384380')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
