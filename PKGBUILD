# Maintainer: Lucas Wendel <aur@igeh.me>
pkgname=avra
pkgver=1.3.0
pkgrel=1
pkgdesc="Atmel AVR Assembler for all platforms. Compatible with Atmel's own assembler."
arch=(x86_64)
url="https://sourceforge.net/projects/avra/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=(avra)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2" "$pkgname-$pkgver.patch")
md5sums=('d5d48369ceaa004c4ca09f61f69b2c84'
         'bbdeb05ec02f6d6d625eba9fe73a687b')

prepare() {
	patch -p1 -i $pkgname-$pkgver.patch
}

build() {
chmod +x ./$pkgname-$pkgver/Build
cd ./$pkgname-$pkgver
./Build
}

package() {
mkdir -p $pkgdir/usr/bin/
cp $pkgname-$pkgver/src/avra $pkgdir/usr/bin/avra

}
