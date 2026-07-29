# Maintainer: Markus Meyer <coruja@gmx.de>

pkgname=zoitechat
pkgver=2.19.0
pkgrel=1
pkgdesc="GTK3 IRC client based on HexChat"
arch=('x86_64')
url="https://github.com/ZoiteChat/zoitechat"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libcanberra' 'python-cffi' 'libayatana-appindicator')
makedepends=('meson' 'glib2-devel' 'perl' 'lua')
optdepends=('pciutils: sysinfo plugin support' 'perl: perl script support' 'lua: lua script support' 'noto-fonts-emoji: emoji support')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a0194adf3b8b21a5ca06dc453440f71ae491ca48ec721dd839ccf2c2775b55fe')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
