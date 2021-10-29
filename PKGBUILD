# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Sergei Kolesnikov <youremail@domain.com>

pkgname=gnome-shell-extension-runcat
pkgver=15
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
makedepends=('make' 'zip')
source=("${url}/archive/v${pkgver}.tar.gz")
_srcname=gnome-runcat
sha512sums=('ca6bc6d909605fc8744a40d958fb6c0225e0c419e87778c9515433678844b49c4f880a0f5262f96f24c0e037984ff3d342f917eec56a15474026bf6296a97ac7')

build() {
	cd "$_srcname-$pkgver"
	make build
}

package() {
	_uuid='runcat@kolesnikov.se'
	cd "$_srcname-$pkgver"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	bsdtar -xvf dist/$_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
