pkgname=ant-dracula-gtk-theme
pkgver=1.2.0
pkgrel=1
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://github.com/EliverLara/Ant-Dracula
depends=('gtk3')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://github.com/EliverLara/Ant-Dracula/archive/v$pkgver.tar.gz")
sha256sums=('8f8336340eae4178f3f1b22d6c591342fbbe11d1d0d9159041ecb52818b25076')

package(){
	cd "$srcdir"
    mv "Ant-Dracula-$pkgver" "Ant-Dracula"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
