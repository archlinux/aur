# Maintainer:
pkgname=grub-theme-creator
_pkgver=0.1.0-alpha-2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automates the creation of a grub2 theme"
arch=('any')
url="https://github.com/petsam/grub-theme-creator"
license=('GPL3')
depends=('horizontal-grub' 'imagemagick')
optdepends=('grub2-theme-preview')
source=("$pkgname-$pkgver.tar.gz::https://github.com/petsam/$pkgname/archive/$_pkgver.tar.gz")
sha256sums=('b249aa9b3f6cde6a578a946114b633d6fa944c8b9be5d813deb51d5ba0860df5')

package() {
	cd "$pkgname-$_pkgver"
	install -d "$pkgdir"/usr/share/prettygrub
	cp -r templates  "$pkgdir"/usr/share/prettygrub/
	install -Dm755 prettygrub "$pkgdir"/usr/bin/prettygrub
	install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
}
