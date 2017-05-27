# Maintainer: Tim Cassels <cassels2025@gmail.com>

pkgname=flwrap
pkgver=1.3.4
pkgrel=2
pkgdesc="file encapsulation / compression for fldigi"
arch=("x86_64")
url="http://www.w1hkj.com/"
license=("gpl")
depends=()
optdepends=()
source=("https://downloads.sourceforge.net/project/fldigi/flwrap/$pkgname-$pkgver.tar.gz")
md5sums=("599709df9f410ad7cab02ae52424b9d8")

package() {
	cd ..
	pwd
	ls
	install -Dm644 $pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm644 $pkgname.xpm "${pkgdir}/usr/share/icons/$pkgname.xpm"
	cd "${srcdir}/$pkgname-$pkgver"
	pwd
	./configure
	make
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 src/$pkgname "${pkgdir}/usr/bin/$pkgname"
}
