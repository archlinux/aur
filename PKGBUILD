# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Sergei Kolesnikov <youremail@domain.com>

pkgname=gnome-shell-extension-runcat
pkgver=11
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
makedepends=('make' 'zip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
_srcname=gnome-runcat
sha512sums=('SKIP')

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