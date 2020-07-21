# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-web-bin
pkgver="10.6.0_1"
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
sha256sums=('6eca277a3a8974a0136b56876c0fd5c9c4dadb58807894cc7aae1eb2caf15046')

options=('staticlibs')

package() {
	tar -xf data.tar.xz
	cp -r "$srcdir"/usr "$pkgdir"/
}

