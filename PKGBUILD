# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-silver-gtk
pkgver=6.8.0
pkgrel=1
pkgdesc='Silver widget theme for GTK 2 and 3'
arch=('any')
url='https://github.com/Sonic-DE/sonic-silver-gtk'
license=('LGPL-2.0-or-later')
depends=()
makedepends=(
	'python-cairo'
	'sassc'
	'sonic-frameworks-cmake-modules'
	'sonic-silver'
)
provides=('breeze-gtk')
conflicts=('breeze-gtk')
options=('!debug')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3f6a325544b03d2f8b787381e55320d62b96504d6a78bfa85e3180ca48137ce8')

build(){
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
