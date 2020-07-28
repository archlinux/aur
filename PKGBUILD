# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-web-bin
pkgver="10.6.1_1"
_pkgver=$(echo "$pkgver" | cut -f1 -d"_")
_pkgverfull="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Free Software Media System - web package'
arch=('any')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin-web')
conflicts=('jellyfin-web' 'jellyfin-web-git')
source=("https://repo.jellyfin.org/releases/server/debian/versions/stable/web/${_pkgver}/jellyfin-web_${_pkgverfull}_all.deb")
sha256sums=('6feb248df97582b5448e189c83547f890f66db6117c77be55ad96ac4887350a5')

options=('staticlibs')

package() {
	tar -xf data.tar.xz
	cp -r "$srcdir"/usr "$pkgdir"/
}

