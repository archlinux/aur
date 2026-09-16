# Maintainer: Markus Meyer <coruja@gmx.de>

pkgname=zoitechat
pkgver=2.19.1
pkgrel=1
pkgdesc="GTK3 IRC client based on HexChat"
arch=('x86_64')
url="https://github.com/ZoiteChat/zoitechat"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libcanberra' 'python-cffi' 'libayatana-appindicator')
makedepends=('meson' 'glib2-devel' 'perl' 'lua')
optdepends=('pciutils: sysinfo plugin support' 'perl: perl script support' 'lua: lua script support' 'noto-fonts-emoji: emoji support')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a64273ec61658730a21514de914aa160b4eb954d563c5d55450ca8cfe332a098')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
