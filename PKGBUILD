# Maintainer: TingPing tingping@tingping.se

pkgname=plist-viewer
pkgver=0.1.1
pkgrel=1
pkgdesc='Application to open plist files'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/TingPing/plist-viewer'
license=('GPL')
depends=('gtk3' 'libplist' 'desktop-file-utils')
makedepends=('gnome-common')
install='plist-viewer.install'
source=("https://github.com/TingPing/plist-viewer/releases/download/$pkgver/plist-viewer-$pkgver.tar.xz")
sha256sums=('2a0a964e6fa2bbcb7dde09937e3356f36f3e28333499d4f6b4d235b53c9d1d09')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make -s
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
