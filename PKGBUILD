# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.40.29
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64' 'aarch64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source_x86_64=("dolt-linux.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums_x86_64=('5a4ea49c7b792b98a3f7c9ee2559bbbe4337b51a593817eeded71cc3767d9edb')
sha256sums_aarch64=('5a4ea49c7b792b98a3f7c9ee2559bbbe4337b51a593817eeded71cc3767d9edb')
source_aarch64=("dolt-linux.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-arm64.tar.gz")
noextract=("dolt-linux.tar.gz")

prepare() {
	mkdir -p $srcdir/dolt-linux
	bsdtar -xvf "$srcdir/dolt-linux.tar.gz" --directory="$srcdir/dolt-linux" --strip-components=1
}

package() {
	install -D -t $pkgdir/usr/bin/ $srcdir/dolt-linux/bin/dolt
	#install -D -t $pkgdir/usr/share/licenses/dolt/ $srcdir/LICENSE
}
