# Maintainer: e792a8 <1571224208@qq.com>

pkgname=sudo_confirm
pkgver=0.1.0
pkgrel=1
pkgdesc='A sudo plugin providing a final chance for confirmation before actually executing a command'
arch=(x86_64 i686 pentium4 arm armv7h armv6h aarch64)
url='https://github.com/e792a8/sudo_confirm'
license=(MIT)
depends=('sudo>=1.8.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/e792a8/sudo_confirm/archive/v$pkgver.tar.gz")
sha256sums=('3cc59e144b8e3150e146804508ee61e9a928a85aa8f34244c6958b095bf3bf07')
install='sudo_confirm.install'

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 sudo_confirm.so "$pkgdir/usr/lib/sudo/sudo_confirm.so"
}
