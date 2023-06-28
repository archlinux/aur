# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97 at gmail dot com>
pkgname=pulsarctl
pkgver=1.1.0
pkgrel=1
pkgdesc="Control Xanova Pulsar XK400 backlight and keylight effects"
arch=('x86_64')
url="https://github.com/aedalzotto/pulsarctl"
license=('GPL3')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d5ae0cea0f226da54bf1fcf3fa3109c23c8f487477b275c594f15ce3af39100f')
makedepends=(
	'meson'
	'ninja'
	'argparse'
)
depends=(
	'hidapi'
)

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

package() {
 	meson install -C build --destdir "$pkgdir"
}
