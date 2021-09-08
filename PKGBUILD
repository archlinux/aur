# Maintainer: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=ordne
pkgver=1.0.2
pkgrel=1
pkgdesc="A Simple Pomodoro Timer"
arch=('x86_64')
url="https://appcenter.elementary.io/com.github.candiedoperation.ordne/"
license=('GPL3')
depends=('granite' 'libhandy')
makedepends=('meson' 'vala')
provides=('com.github.candiedoperation.ordne')
conflicts=('com.github.candiedoperation.ordne')
source=("ordne-$pkgver.tar.gz::https://github.com/candiedoperation/ordne/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('56622b8e333f89ed6ce77c9cee31c1c47d0f3ca26f8d21688592a7d9769e1dbf')

build() {
	arch-meson ordne-$pkgver build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
