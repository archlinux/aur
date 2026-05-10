# Maintainer: Markus Meyer <coruja@gmx.de>

pkgname=zoitechat
pkgver=2.18.0
pkgrel=1
pkgdesc="HexChat based IRC client for Windows and UNIX-like operating systems"
arch=('x86_64')
url="https://github.com/ZoiteChat/zoitechat"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libcanberra' 'python-cffi' 'libayatana-appindicator')
makedepends=('meson' 'glib2-devel' 'perl' 'lua')
optdepends=('pciutils: sysinfo plugin support' 'perl: perl script support' 'lua: lua script support')
source=("$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('6a646086482188212340ef69da013cb58d657081ee8e0dc64f80e13cde34f4a9')

build() {
	#~ cd $pkgname-$pkgname-$pkgver
	arch-meson "$pkgname-$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	#~ cd $pkgname-$pkgname-$pkgver
	meson install -C build --destdir "$pkgdir"
}
