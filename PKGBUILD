# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.9v
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('x86_64')
url="https://github.com/netxs-group/vtm"
license=('MIT')
provides=(vtm)
conflicts=(vtm-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/netxs-group/vtm/releases/download/v$pkgver/vtm_linux_x86_64.tar.gz"
	https://raw.githubusercontent.com/netxs-group/vtm/92dbe4054f0824648a8e33a6320bd6f3946508cf/LICENSE)
sha256sums=('bd2530020d6fc240bcfe15c46c40112b72a829591a13d82db281da6879978f28'
            '7b7086edfedec1a2d8b40bc3748c2b77688806b4ab1081c3570fd7bb9b2c7842')

package() {
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	tar -xvpf vtm_linux_x86_64.tar
	install -vDm755 vtm_linux_x86_64/vtm $pkgdir/usr/bin/vtm
}
