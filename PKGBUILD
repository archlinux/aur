# Maintainer: Scott Lill <dev at scottlill dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=8
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-3.0')
depends=('gnome-shell')
source=("${url}/-/archive/v${pkgver}/azwallpaper-v${pkgver}.tar.gz")
sha256sums=('97f75421a8b4aeecfe27625651505b721775503fb596ea24a0d917592a6329df')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
