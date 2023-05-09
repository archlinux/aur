# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Sergei Kolesnikov <youremail@domain.com>

pkgname=gnome-shell-extension-runcat
pkgver=23
pkgrel=1
pkgdesc="The cat tells you the CPU usage by running speed"
arch=('any')
url="https://github.com/win0err/gnome-runcat"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
_srcname=gnome-runcat
b2sums=('89c72bcfc61e14d15479abc583d5fba5464529b468610725a93c47da9df1cc4a181f25d82ab53006473707e252b0268c6ef4888ed9cd8ea6d0b76599b03b34ed')

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
