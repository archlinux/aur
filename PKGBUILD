# Maintainer: Yufan You <ouuansteve at gmail.com>

pkgname=uoj-data-converter
pkgver=0.4.2
pkgrel=1
pkgdesc='将各种各样格式的数据转换为 UOJ 的格式'
arch=('x86_64')
url='https://github.com/ouuan/uoj-data-converter'
license=('Apache')
depends=('qt5-base')
makedepends=(
	'cmake'
	'git'
	'ninja'
)
conflicts=("uoj-data-converger-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ouuan/uoj-data-converter/archive/$pkgver.tar.gz")
sha256sums=('f82b4a156e5d0fee5ed1ba354415397e85d377ba8af739c516197f754b8aeb73')

build() {
	cd "$pkgname-$pkgver"
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -GNinja
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir/" ninja install
}
