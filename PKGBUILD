# Maintainer: Davide Depau <davide@depau.eu>

pkgname=ant-dracula-gtk-theme
pkgver=1.3.0
pkgrel=1
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://github.com/EliverLara/Ant-Dracula
depends=('gtk3')

# Hash and Timestamp (taken from macos-icon-theme pkgbuild)
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://github.com/EliverLara/Ant-Dracula/archive/v$pkgver.tar.gz")
sha256sums=('5de816ebdcdc5cccf02c8965bf7a38e0a9718a769e274505bcf3809d3ce6ece8')

package(){
	cd "$srcdir"
    mv "Ant-Dracula-$pkgver" "Ant-Dracula"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
