# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=dnsdock-bin
pkgver=1.17.0
pkgrel=3
pkgdesc='DNS service discovery for Docker containers '
arch=('x86_64' 'aarch64')
url='https://github.com/aacebedo/dnsdock'
license=('MIT')
provides=('dnsdock')
conflicts=('dnsdock')
source=('dnsdock.service')
source_x86_64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-x86_64.tar.gz::https://github.com/aacebedo/dnsdock/releases/download/v${pkgver}/dnsdock_.${pkgver}_.linux_.amd64.tar.gz")
source_aarch64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-aarch64.tar.gz::https://github.com/aacebedo/dnsdock/releases/download/v1.17.0/dnsdock_.1.17.0_.linux_.armv6l.tar.gz")

b2sums=('ff0ea65143650e9adf137e047b2bbd94964747d6565b25ff60e34bdc7a6c835cfe2717034d65e56f7a36c3b1d82cfd758b06ace126abb37f702acea7f1ebec6b')
b2sums_x86_64=('98eb95f609c4cd41796f7b33029043a1173ff89d3098b0ef8d150007f4a0ff5048176d7ea3ca0a6ba93a9d9995f77c9d39df0c33e2c0284c371d80c49102e9ad')
b2sums_aarch64=('4ec15b5bd055c279326c3f41ef0f2bbfacb517257992675c5549c79afd444019c68793808623a8a3f1674ba641b786bbf84270563909780b2ba2d6ab24f59227')

package() {
	install -Dm755 "$srcdir/dnsdock" "$pkgdir/usr/bin/dnsdock"
	install -Dm644 "$srcdir/dnsdock.service" "$pkgdir/usr/lib/systemd/system/dnsdock.service"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
