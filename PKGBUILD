# Maintainer: Scott Lill <dev at scottlill dot com>
# Maintainer: Henrique Custódio <henriqueffc at tutanota dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=14.1
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-2.0-or-later')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/azwallpaper-v${pkgver}.tar.gz")
sha256sums=('bb6c66bf3956fdca4734ee227352804c7c2bccf9790152724d5d363f9a182242')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
