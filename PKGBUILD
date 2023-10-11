# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-runcat
pkgver=26
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
_srcname=gnome-runcat
b2sums=('2a7dbc8d809248ddc93c24e47e72af1ee3eadba60ca5f70a1071e1fa9e8f3feeb33b5684c6dedcdce4fb8d39315417a68a5560b6e3d0d32df725a4231e693279')

build() {
	cd "$_srcname-$pkgver"
	make build
}

package() {
	_uuid='runcat@kolesnikov.se'
	cd "$_srcname-$pkgver"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	bsdtar -xvf dist/$_uuid.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
