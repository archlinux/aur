# Maintainer: restitux <restitux at ohea dot xyz>

pkgname=qemu-ovmf-secureboot
pkgver=1.1.2
pkgrel=2
pkgdesc="Script to generate an OVMF vars file with default secure boot key enrolled. "
arch=('any')
url='https://github.com/rhuefi/qemu-ovmf-secureboot'
license=('MIT')
depends=('python' 'qemu')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6cba11b5e05c0fc19554048a968c842037411dba2f43e5d22c38a39fe17448f8')

package() {
	cd "$pkgname-$pkgver"
	install -D "ovmf-vars-generator" -t "$pkgdir/usr/bin/"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
