# Maintainer: Michael Schwaiger <michael@internet-seite.de>
pkgname=wl-gammactl
pkgver=0.0.1
pkgrel=1
pkgdesc="Command-line / GUI utility for setting contrast, brightness and gamma on wlroots based compositors"
arch=('i686' 'x86_64')
url="https://github.com/mischw/wl-gammactl.git"
license=('MIT')
depends=('gtk3')
makedepends=('git' 'meson')
source=("git+https://github.com/mischw/wl-gammactl.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname%-git}"
	meson build
	ninja -C build
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/${pkgname%-git}/build/wl-gammactl" "$pkgdir/usr/bin/"
	install -Dm644 ${pkgname%-git}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
