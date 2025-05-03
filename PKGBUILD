# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Vítor Vasconcellos <vitor.vasconcellos at proton dot me>

pkgname=tail-tray
pkgver=0.2.21
pkgrel=1
pkgdesc='Tailscale tray menu and UI for the KDE Plasma Desktop'
arch=(x86_64 aarch64)
url='https://github.com/SneWs/tail-tray'
license=(GPL-3.0-or-later)
depends=(tailscale qt6-base davfs2)
makedepends=(extra-cmake-modules qt6-tools)
source=("git+https://github.com/SneWs/tail-tray#tag=v$pkgver")
sha512sums=('b25c042af500c77c459289aafff6bf4d09729d426d7d8d896f4957d3e789e06c9c4c066c2d4347ffec51fbfc125ef96a0ddb2cf224ae6b644b968491434a60fa')

build() {
	cd $pkgname
	cmake -B build
	cmake --build build
}

package() {
	cd $pkgname
	DESTDIR="$pkgdir" cmake --install build
}
