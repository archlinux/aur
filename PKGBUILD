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
sha256sums=('2a05c2b73f431707da202793cb1d34563993b70102dc2e0a1462ad0b9fc107e6')
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
