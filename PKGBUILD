# Maintainer: voidVoy7 <voidvoy7@proton.me>
pkgname=omniwrap
pkgver=1.5
pkgrel=0
pkgdesc="A Package Manager wrapper"
arch=("x86_64")
url="https://github.com/voidVoy7/Omniwrap"
license=('GPL-3.0')
makedepends=('go')
source=("https://github.com/voidVoy7/Omniwrap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a028e7cc60009a868088f671b1f7b2907972397b7cd666d8ef2bf9ed3b74000d')

build() {
	cd "Omniwrap-$pkgver"
	go build -o ow -buildmode=pie -trimpath
}

package() {
	cd "Omniwrap-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "ow"
}
