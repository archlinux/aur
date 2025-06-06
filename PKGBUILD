# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# shellcheck disable=SC2034,2154
_pkgorg=camunda
_pkgname=$_pkgorg-modeler
pkgname=$_pkgname-bin
pkgver=5.36.0
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN, DMN and Forms based on bpmn.io"
arch=('x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('MIT')
depends=('xdg-utils' 'gtk3' 'nss')
install=$_pkgname.install
source=(
	"https://github.com/$_pkgorg/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x64.tar.gz"
	"$_pkgname.install"
	"$_pkgname.sh")
b2sums=('dc4af231711868ca400a2325afccedc410672e62bd6c7c09d6a27c92b46360a4dc02dca8de88c2e07094745929d2a064eceb50c1ae466799388581280df6c950'
        '67491c423c4513c78a01c47cffd0e28287a18913fd7c7b39278d0eeba6203432a84f5db221e9d3c2e755b42fa9a5063c246644c07dcaedc0b0c3f0af2777d604'
        'e2d15fa4996ba95fb29fabaafb57efc0bca02d5d073b25bd453e9f72aa4ca7f02ebe4454c711e26559940ca3e24422c2361a900a9b39c9c42e6cb22547a042a2')

package() {
	install -d "$pkgdir"/opt/$_pkgname
	cp -af "$srcdir"/$_pkgname-$pkgver-linux-x64/* "$pkgdir"/opt/$_pkgname
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/opt/$_pkgname/$_pkgname.sh"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
