pkgname=ant-nebula-gtk-theme
pkgver=1.3.0
pkgrel=5
pkgdesc="Ant Nebula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://github.com/EliverLara/Ant-Nebula/releases/download/v1.3.0/Ant-Nebula.tar")
sha256sums=('7fc96426b50df1b06ea9d333fbb20626aaf6c0de5bbc7a4899f2557b4ee1eff6')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
