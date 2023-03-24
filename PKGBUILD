# Maintainer: restitux <restitux at ohea dot xyz>

pkgname=qemu-ovmf-secureboot-git
pkgver=v1.1.3.r14.g4da81a4
pkgrel=1
pkgdesc="Script to generate an OVMF vars file with default secure boot keys enrolled. (git build)"
arch=('any')
url='https://github.com/rhuefi/qemu-ovmf-secureboot'
license=('MIT')
depends=('python' 'qemu')
provides=('qemu-ovmf-secureboot')
conflicts=('qemu-ovmf-secureboot')
source=("$pkgname::git+https://github.com/rhuefi/qemu-ovmf-secureboot")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	install -D "ovmf-vars-generator" -t "$pkgdir/usr/bin/"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
