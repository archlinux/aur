# Maintainer: Beriholic <beriholic at petalmail dot com>
pkgname=arch-mirror-gen
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Archlinux 大陆镜像源自动获取工具"
arch=('x86_64' 'aarch64' 'loong64')
url="https://github.com/Beriholic/arch-mirror-gen"
license=('GPLv3')
depends=(
    'go'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Beriholic/arch-mirror-gen/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('34d6669af0027051ecac02cc76c0b9b6f634636bed86ddfd3e9b4e6d025e584e')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	go build -o $pkgname -trimpath -ldflags="-s -w"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
