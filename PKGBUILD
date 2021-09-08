# Maintainer: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=pop-shop-git
pkgver=master
pkgrel=1
pkgdesc="A fast and simple software center"
arch=('x86_64')
url="https://github.com/pop-os/shop"
license=('GPL3')
depends=('granite' 'libhandy' 'packagekit' 'appstream' 'flatpak')
makedepends=('meson' 'vala')
provides=('io.elementary.appcenter')
conflicts=('appcenter')
source=("shop-$pkgver.tar.gz::https://github.com/pop-os/shop/archive/refs/heads/$pkgver.zip")
sha256sums=('fad48b1263e823964ad6cc77d5810137cfdd03268e88b26dfc13ed67323e418c')

build() {
	arch-meson shop-$pkgver build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
