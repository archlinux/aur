# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=grub-theme-creator
pkgver=.0.2
pkgrel=1
pkgdesc="Automates the creation of a grub2 theme"
arch=('any')
url="https://github.com/petsam/grub-theme-creator"
license=('GPL3')
depends=('horizontal-grub' 'imagemagick')
optdepends=('grub2-theme-preview')
source=("$pkgname-$pkgver.tar.gz::https://github.com/petsam/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fb44eba30534736b9af65f07868c104720d92a177c37cc3c1f218f41b454c495')

package() {
	cd "$pkgname-v$pkgver"
	install -d $pkgdir/usr/share/prettygrub
	cp -r templates  $pkgdir/usr/share/prettygrub/
	install -Dm755 prettygrub $pkgdir/usr/bin/prettygrub
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
