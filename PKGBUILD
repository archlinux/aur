pkgname=bshchk-bin
pkgver=1.1
pkgrel=1
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
provides=('bshchk')
conflicts=('bshchk')

source_x86_64=(
	"https://git.blek.codes/blek/bshchk/releases/download/$pkgver/bshchk.linux.amd64"
	"https://git.blek.codes/blek/bshchk/releases/download/$pkgver/bshchk.linux.amd64.asc"
)
source_aarch64=(
	"https://git.blek.codes/blek/bshchk/releases/download/$pkgver/bshchk.linux.arm64"
	"https://git.blek.codes/blek/bshchk/releases/download/$pkgver/bshchk.linux.arm64.asc"
)

validpgpkeys=('A6C038E03D212D06575053ADA622C22C9BC616B2')
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')

package() {
	file=$(find . -name "bshchk.linux.*" | grep -vE '.asc$')
	install -Dm755 $file "$pkgdir/usr/bin/bshchk"
}
