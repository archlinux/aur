# Maintainer: voidVoy7 <voidvoy7@proton.me>
pkgname=Omniwrap
pkgver=1.0
pkgrel=0
pkgdesc="A Package Manager wrapper"
arch=("x86_64")
url="https://github.com/voidVoy7/Omniwrap"
license=('GPL-3.0')
makedepends=('go')
source=("https://github.com/voidVoy7/Omniwrap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b9d10112702ec2ac79bc486e3c8f96f52429d6ac440a9dccec22f2f4bbf9d52a')

build() {
	cd "$pkgname-$pkgver"
	go build -buildmode=pie -trimpath
}

package() {
	cd "$pkgname-$pkgver"
	mv Omniwrap ow
	install -Dm0755 -t "$pkgdir/usr/bin/" "ow"
}
