# Maintainer: Sam Day <me@samcday.com>

pkgname="qrtr"
pkgdesc="Userspace reference for net/qrtr in the Linux kernel"
pkgver=1.0
pkgrel=2
arch=(aarch64 x86_64)
url="https://github.com/andersson/qrtr"
license=("BSD-3-Clause")
_srcname="${pkgname}-${pkgver}"
source=("${_srcname}.tar.gz::https://github.com/linux-msm/qrtr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dc5db4872ff0d3c43b5c6d115fadc94f393c9c8c89b4246e327853b466d6c49f')

build() {
	cd "$_srcname"

	make prefix=/usr all
}

package() {
	cd "$_srcname"

	make prefix=/usr DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}
