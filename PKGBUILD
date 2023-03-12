# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.8v
pkgrel=1
epoch=
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('x86_64')
url="https://github.com/netxs-group/vtm"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(vtm)
conflicts=(vtm-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/netxs-group/vtm/releases/download/v$pkgver/vtm_linux_amd64.tar.gz"
https://raw.githubusercontent.com/netxs-group/vtm/master/LICENSE)
noextract=()
sha256sums=('55c409a8f55bdb2ef661adaf04407c2e6ff2af8d9a369fa39409ed9970697c9a'
            '7b7086edfedec1a2d8b40bc3748c2b77688806b4ab1081c3570fd7bb9b2c7842')
validpgpkeys=()

package() {
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	tar -xvpf vtm_linux_amd64.tar
	install -Dm755 vtm_linux_amd64/vtm $pkgdir/usr/bin/vtm
}
