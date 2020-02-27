# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
_pkgname=dash-to-dock-ubuntu-dock
pkgver=67ubuntu20.04.1
pkgrel=1
pkgdesc="A dock for the Gnome Shell, default Ubuntu experience"
arch=('any')
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext')
source=("https://github.com/micheleg/dash-to-dock/archive/ubuntu-dock-$pkgver.tar.gz")
sha256sums=('48776347fa447263c8a463889666813f7be51e2088c14db728b67f46f967ffa3')

build() {
	cd ${_pkgname}-${pkgver}
	make
}

package() {
	cd ${_pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
