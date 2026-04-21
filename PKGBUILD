# Maintainer: Scott Lill <dev at scottlill dot com>
# Maintainer: Henrique Custódio <henriqueffc at tutanota dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=14.2
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-2.0-or-later')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/azwallpaper-v${pkgver}.tar.gz")
sha256sums=('1903075c511ba0f88698feeb3ba922ef00a8d7968761a262cbbe3664b56d637b')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
