# Maintainer: Sebaguardian <Sebaguardian13@gmail.com>

_pkgname=biangfont
__pkgname="ttf-$_pkgname"
pkgname="$_pkgname-git"
pkgver=r.6de5221
pkgrel=1
pkgdesc='A small font for the Chinese character “biang2”, both traditional and simplified'
arch=('any')
url="https://github.com/fontfish/$_pkgname"
license=('OFL-1.1')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')
provides=("$__pkgname")
conflicts=("$__pkgname")

pkgver() {
	cd "$_pkgname"
	echo "r.$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	install -d "$pkgdir/usr/share/fonts/$_pkgname"
	cp -R Font_Files/* "$pkgdir/usr/share/fonts/$_pkgname"
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
