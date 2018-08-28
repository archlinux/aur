pkgname="eidolon"
pkgver=1.4.0
pkgrel=1
pkgdesc="Provides a single TUI-based registry for drm-free, wine and steam games on linux, accessed through a rofi launch menu."
arch=('any')
url="https://github.com/nicohman/eidolon"
license=('GPL')
makedepends=(rust cargo)
depends=(rofi)
conflicts=(eidolon-git)
source=("https://github.com/nicohman/eidolon/archive/${pkgver}.tar.gz")
sha256sums=('1e19206871d840cbcad67a79bdf75b06396e505fbb2939b657af369ccef86773')

package() {
	cd ${pkgname}-${pkgver}
	cargo build --release
	install -d -m 755 ${pkgdir}/usr/bin
	cp target/release/eidolon ${pkgdir}/usr/bin/eidolon
}

