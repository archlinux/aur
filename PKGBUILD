# Maintainer: beest <gnubeest@zoho.com>

pkgname=motsognir
pkgver=1.0.9
pkgrel=2
pkgdesc="a robust, reliable and easy to install gopher server"
arch=(x86_64)
url="http://motsognir.sourceforge.net/"
license=('GPL3')
optdepends=('php: php scripting support')
source=("https://downloads.sourceforge.net/project/$pkgname/v$pkgver/$pkgname-$pkgver.tar.xz" \
	"motsognir.service")
md5sums=('21a3d6638d105d70c4579cf23d0118b6'
         'a2a1198714bdb256137cf84c25b28d75')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "motsognir" \
		"${pkgdir}/usr/bin/motsognir"
	install -Dm644 "motsognir.conf" \
		"${pkgdir}/etc/motsognir.conf"
	install -Dm644 "motsognir.8.gz" \
		"${pkgdir}/usr/share/man/man8/motsognir.8.gz"
	install -Dm644 "manual.pdf" \
		"${pkgdir}/usr/share/doc/motsognir/manual.pdf"
	install -Dm644 ../motsognir.service \
		"${pkgdir}/usr/lib/systemd/system/motsognir.service"
}
