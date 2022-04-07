# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Sergei Kolesnikov <youremail@domain.com>

pkgname=gnome-shell-extension-runcat
pkgver=18
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=("${url}/archive/v${pkgver}.tar.gz")
_srcname=gnome-runcat
b2sums=('d57c060945c2797f95725931664a08ca99b9318a78565b78c884d5d953981d6249767f21166b850498a4ed3fa2e03ef1ef4a201edb882cc89e8d7292cb723f9a')

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
