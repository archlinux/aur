# Maintainer: thorou <thorou@chirality.de>

_pkgname=sunset-cursors
pkgname=sunset-cursors-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Sunset Cursors for linux desktops"
arch=(any)
url="https://github.com/yeyushengfan258/Sunset-Cursors"
license=('GPL3')
depends=()
source=("$_pkgname::git+https://github.com/yeyushengfan258/Sunset-Cursors.git")

sha256sums=('SKIP')

package() {
	local src="$srcdir/$_pkgname/dist"
	local dest="$pkgdir/usr/share/icons/$_pkgname"
	
	install -dm755 "$dest/cursors"
	install -m644 "$src/index.theme" "$dest"
	
	# cp to preserve symlinks
	cp -a $src/cursors/* "$dest/cursors"
	chmod 644 $dest/cursors/*
}
