# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.40.30
pkgrel=2
pkgdesc='Git for data!'
arch=('x86_64' 'aarch64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source_x86_64=("dolt-linux.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz"
		"LICENSE")
sha256sums_x86_64=('1e8d015e0b8d76f9ef4c3560a3da45a7e3c7b242ed9ea97114c37447e0c4edd5'
                   'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('1e8d015e0b8d76f9ef4c3560a3da45a7e3c7b242ed9ea97114c37447e0c4edd5'
                    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
source_aarch64=("dolt-linux.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-arm64.tar.gz"
		"LICENSE")
noextract=("dolt-linux.tar.gz")

prepare() {
	mkdir -p $srcdir/dolt-linux
	bsdtar -xvf "$srcdir/dolt-linux.tar.gz" --directory="$srcdir/dolt-linux" --strip-components=1
}

package() {
	install -D -t $pkgdir/usr/bin/ $srcdir/dolt-linux/bin/dolt
	install -Dm644 -t $pkgdir/usr/share/licenses/dolt/ $srcdir/LICENSE
}
