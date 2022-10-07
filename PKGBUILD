# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Sergei Kolesnikov <youremail@domain.com>

pkgname=gnome-shell-extension-runcat
pkgver=21
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
_srcname=gnome-runcat
b2sums=('51f00ba9efcf39a377cee685886b164a6a4fc59ab3e6ccd9d879a0000b76fc26a75732301090386146dd04eceb54324af81bb20db23fa35feac03e5df6d36b74')

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
