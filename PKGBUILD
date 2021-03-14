# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=jellyfin-web-bin
pkgver="10.7.0_1"
_pkgver=$(echo "$pkgver" | cut -f1 -d"_")
_pkgverfull="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Free Software Media System - web package'
arch=('any')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin-web')
conflicts=('jellyfin-web' 'jellyfin-web-git')
source=("https://repo.jellyfin.org/releases/server/debian/stable/web/jellyfin-web_${_pkgverfull}_all.deb")
sha256sums=('19cf6bad41176c46950bf5ebb5cfd94efda4582cb898524e0a1ea7576e523af1')

options=('staticlibs')

package() {
	tar -xf data.tar.xz
	cp -r "$srcdir"/usr "$pkgdir"/
}

