# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-web-bin
pkgver="10.7.0~rc2"
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
sha256sums=('e2c43a203f64115e0bedef76d61b3f78e0297130d4deb99b23e4cb7f53b655a4')

options=('staticlibs')

package() {
	tar -xf data.tar.xz
	cp -r "$srcdir"/usr "$pkgdir"/
}

