# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-runcat
pkgver=27
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
_srcname=gnome-runcat
b2sums=('1fc4af207b098d8207ab3a3cfe15e0acc2a3ae97fcc72448d273b656d195d6e8148223b04da0d5799d29442755db004c54eceb37034b6c7111a66cf90dc191bd')

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
