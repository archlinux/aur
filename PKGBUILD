# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.9w
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('x86_64')
url="https://github.com/netxs-group/vtm"
license=('MIT')
provides=(vtm)
conflicts=(vtm-git)
source=("$pkgname-$pkgver.zip::https://github.com/netxs-group/vtm/releases/download/v$pkgver/vtm_linux_x86_64.zip"
	https://raw.githubusercontent.com/netxs-group/vtm/92dbe4054f0824648a8e33a6320bd6f3946508cf/LICENSE)
sha256sums=('6e23e37fc9fccb6769b1c9138733ef38cbcc811dc8d68673923c371e901745a8'
            '7b7086edfedec1a2d8b40bc3748c2b77688806b4ab1081c3570fd7bb9b2c7842')

package() {
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	tar -xvpf vtm_linux_x86_64.tar
	install -vDm755 vtm $pkgdir/usr/bin/vtm
}
