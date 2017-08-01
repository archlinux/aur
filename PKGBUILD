# Maintainer: ray45422 <ray45422[at]gmail[dot]com>

pkgname=('dub-arm')
pkgver=1.4.0
pkgrel=2
pkgdesc="Developer package manager for D programming language"
arch=('armv7h')
url="https://github.com/D-Programming-Language/dub"
license=('MIT')
makedepends=('ldc')
depeonds=('liblphobos' 'curl')
provides=('dub')
conflicts=('dub')

source=($pkgname-$pkgver.tar.gz::https://github.com/dlang/dub/archive/v$pkgver.tar.gz)
sha512sums=('0a21149da3bb09b4c384464eab33adc640938baa9e0bbdac6335583aa6ffe4735846244f2897dfdbd12778ec218b256cf2c58c436c5ffa7244b327af49584ffe')

build() {
	cd "dub-$pkgver"
	./build.sh
}

package() {
	install -Dm755 "dub-$pkgver/bin/dub" "$pkgdir/usr/bin/dub"
	install -Dm644 "dub-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "dub-$pkgver/scripts/bash-completion/dub.bash" "$pkgdir/usr/share/bash-completion/completions/dub"
}
