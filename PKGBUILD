pkgname="eidolon"
pkgver=1.1.1
pkgrel=2
pkgdesc="A couple of full-dark, neutral-gray themes (for GTK2, GTK3, Shell, and GDM) using the Equilux palette."
arch=('any')
url="https://github.com/nicohman/eidolon"
license=('GPL')
makedepends=(rust cargo)
depends=(rofi)
source=("https://github.com/nicohman/eidolon/archive/1.1.1.tar.gz")
sha256sums=('e640588676dcc6c4b90c70eb167b73c3a562de0012f0accec36c3a8bec3a9dfd')

package() {
	cd ${pkgname}-${pkgver}
	cargo build --release
	install -d -m 755 ${pkgdir}/usr/bin
	cp target/release/eidolon ${pkgdir}/usr/bin/eidolon
}

