# Maintainer: Colin Reeder <vpzomtrrfrt@gmail.com>
_pkgname=badpng
pkgname=$_pkgname-git
source=("hg+https://bitbucket.org/runhello/badpng")
md5sums=('SKIP')
pkgdesc="Tool incorrectly re-encodes a PNG."
arch=('x86_64' 'i686')
pkgrel=1
pkgver=r7.06e4ea7a42b3
makedepends=('mercurial')
pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	cd "$_pkgname"
	make
	install -dm 755 "$pkgdir"/usr/bin
	install -m 755 ./badpng "$pkgdir"/usr/bin
}
