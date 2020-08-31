# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-web-bin
pkgver="10.6.4_1"
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
sha256sums=('5eb7a6de9f3ac20e40131c89aa897cfe5847963db3951f7651ca44c5105f5fa9')

options=('staticlibs')

package() {
	tar -xf data.tar.xz
	cp -r "$srcdir"/usr "$pkgdir"/
}

