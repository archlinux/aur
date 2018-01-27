pkgname="eidolon"
pkgver=1.1.1
pkgrel=2
pkgdesc="Provides a single TUI-based registry for drm-free, wine and steam games on linux, accessed through a rofi launch menu."
arch=('any')
url="https://github.com/nicohman/eidolon"
license=('GPL')
makedepends=(rust cargo)
depends=(rofi)
conflicts=(eidolon-git)
source=("https://github.com/nicohman/eidolon/archive/1.1.1.tar.gz")
sha256sums=('e640588676dcc6c4b90c70eb167b73c3a562de0012f0accec36c3a8bec3a9dfd')

package() {
	cd ${pkgname}-${pkgver}
	cargo build --release
	install -d -m 755 ${pkgdir}/usr/bin
	cp target/release/eidolon ${pkgdir}/usr/bin/eidolon
}

