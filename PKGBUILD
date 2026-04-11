# Maintainer: xiliuya <xiliuya@aliyun.com>

pkgname=lightpanda
pkgver=0.2.8
pkgrel=1
pkgdesc="Headless browser designed for AI and automation - 11x faster than Chrome, 9x less memory"
arch=('x86_64' 'aarch64')
url="https://lightpanda.io"
license=('AGPL-3.0-only')
provides=('lightpanda')
makedepends=('zig>=0.15.2' 'rust' 'cargo' 'git' 'python3')

source=(lightpanda_${pkgver}.tar.gz::https://github.com/lightpanda-io/browser/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('dc97be0dc802321a8d272c42d4300e0c890aa3e3ce6d60f09e6c2275287056c0')
build() {
	cd "browser-${pkgver}"
	make build
}

package() {
	install -Dm755 "${srcdir}/browser-${pkgver}/zig-out/bin/lightpanda" "$pkgdir/usr/bin/lightpanda"
	chmod +x "$pkgdir/usr/bin/lightpanda"
}
