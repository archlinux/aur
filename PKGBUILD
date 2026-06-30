# Maintainer: Markus Meyer <coruja@gmx.de>

pkgname=zoitechat
pkgver=2.18.3
pkgrel=1
pkgdesc="GTK3 IRC client based on HexChat"
arch=('x86_64')
url="https://github.com/ZoiteChat/zoitechat"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libcanberra' 'python-cffi' 'libayatana-appindicator')
makedepends=('meson' 'glib2-devel' 'perl' 'lua')
optdepends=('pciutils: sysinfo plugin support' 'perl: perl script support' 'lua: lua script support')
source=("$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('8b1f5c0742e99457ebd57907221272df871795041c1c18484ce2ba1407444ccc')

build() {
	arch-meson "$pkgname-$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
