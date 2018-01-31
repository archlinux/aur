pkgname="eidolon"
pkgver=1.2.5
pkgrel=1
pkgdesc="Provides a single TUI-based registry for drm-free, wine and steam games on linux, accessed through a rofi launch menu."
arch=('any')
url="https://github.com/nicohman/eidolon"
license=('GPL')
makedepends=(rust cargo)
depends=(rofi)
conflicts=(eidolon-git)
source=("https://github.com/nicohman/eidolon/archive/${pkgver}.tar.gz")
sha256sums=('ff78cb7acb61ad36c620e96aab29acf30b730a669197609141494d624e8fb327')

package() {
	cd ${pkgname}-${pkgver}
	cargo build --release
	install -d -m 755 ${pkgdir}/usr/bin
	cp target/release/eidolon ${pkgdir}/usr/bin/eidolon
}

