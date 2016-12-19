# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=muscript-git
pkgver=r19.fc24049
pkgrel=1
pkgdesc="The muscript music typesetting software and associated tools."
arch=('any')
url="https://github.com/peterbillam/muscript"
license=('unknown')
depends=('perl' 'perl-text-parsewords')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/peterbillam/muscript.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/muscript"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	cp $srcdir/muscript/muscript_pl $pkgdir/usr/bin/muscript
	chmod 755 $pkgdir/usr/bin/muscript
}
