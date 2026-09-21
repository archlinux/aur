# Maintainer: Scott Lill <dev at scottlill dot com>
# Maintainer: Henrique Custódio <henriqueffc at tutanota dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=14.3
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-2.0-or-later')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/azwallpaper-v${pkgver}.tar.gz")
sha256sums=('5e5e5ace865bd58d089efcecf03f30ef1a54bb36560a1d3f0d6ca887949da853')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
