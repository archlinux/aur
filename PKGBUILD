# Maintainer: e792a8 <1571224208@qq.com>

pkgname=sudo_confirm
pkgver=0.2.0
pkgrel=1
pkgdesc='A sudo plugin providing a final chance for confirmation before actually executing a command'
arch=(x86_64 i686 pentium4 arm armv7h armv6h aarch64)
url='https://github.com/e792a8/sudo_confirm'
license=(MIT)
depends=('sudo>=1.8.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/e792a8/sudo_confirm/archive/v$pkgver.tar.gz")
sha256sums=('fb057d59f8a13c4825bd28b91f04e7599828b4e70beadee663907896c31f95d1')
install='sudo_confirm.install'

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 sudo_confirm.so "$pkgdir/usr/lib/sudo/sudo_confirm.so"
}
