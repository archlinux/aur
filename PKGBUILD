pkgname=ant-dracula-gtk-theme
pkgver=1.0.3
pkgrel=7
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
md5sums=('87fc572eb076842e8a0de5b1d10dcbd6')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1516251139/s/$_s/t/$_t/u//Ant-Dracula.tar")

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
