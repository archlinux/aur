# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=vokabeltrainer-git
_pkgname=vokabeltrainer
pkgver=current
pkgrel=1
epoch=2
pkgdesc="A small command-line vocable trainer that uses the Leitner box system."
license=('custom:MIT')
arch=('any')
url="https://github.com/rusio/VokabelTrainer"
depends=('groovy')
makedepends=('git')
source=("$pkgname::git+https://github.com/rusio/VokabelTrainer")
md5sums=('SKIP')

pkgver() {
	echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m755 $pkgname/vokabeltrainer.groovy "$pkgdir/usr/bin/vokabeltrainer"
	mkdir -p "$pkgdir/usr/share/licenses/vokabeltrainer"
	install -m644 $pkgname/LICENSE.md "$pkgdir/usr/share/licenses/vokabeltrainer/"
}
