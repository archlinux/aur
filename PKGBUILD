pkgname="eidolon"
pkgver=1.4.6
pkgrel=1
pkgdesc="Provides a single TUI-based registry for drm-free, wine and steam games on linux, accessed through a rofi launch menu."
arch=('any')
url="https://github.com/nicohman/eidolon"
license=('GPL')
makedepends=(rust cargo)
depends=(rofi)
conflicts=(eidolon-git)
source=("https://github.com/nicohman/eidolon/archive/${pkgver}.tar.gz")
sha256sums=('676df83832c1c19397a3e40c4f0f39b9c46ccecc81f3b6ceb283f68fd020d649')

package() {
	cd ${pkgname}-${pkgver}
	cargo build --release
	install -d -m 755 ${pkgdir}/usr/bin
	cp target/release/eidolon ${pkgdir}/usr/bin/eidolon
}

