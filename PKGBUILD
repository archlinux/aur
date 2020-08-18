# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-web-bin
pkgver="10.6.3_1"
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
sha256sums=('01857340d14a3392350c952c1d3ecbe4d049d6c92b5e30bb3b3145e37e86cbee')

options=('staticlibs')

package() {
	tar -xf data.tar.xz
	cp -r "$srcdir"/usr "$pkgdir"/
}

