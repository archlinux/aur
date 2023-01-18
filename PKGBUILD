# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.52.5
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64' 'aarch64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source_x86_64=("dolt-linux-${pkgver}-amd64.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz"
		"LICENSE")
source_aarch64=("dolt-linux-${pkgver}-arm64.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-arm64.tar.gz"
		"LICENSE")		
sha256sums_x86_64=('29ee1af9f1bfdc8693942168e0a636dd93fc532bd4365e5c8fd5529456269081'
                   'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('5095f10f39967da303eaf3b8d04b0a08435fd33c59e1a3622695d431a72b9559'
                    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
	# Get arch
	if [ "$CARCH" = 'x86_64' ]
	then
		_arch='amd64'
	elif [ "$CARCH" = 'aarch64' ]
	then
		_arch='arm64'
	fi

	install -D -t $pkgdir/usr/bin/ $srcdir/dolt-linux-${_arch}/bin/dolt
	install -Dm644 -t $pkgdir/usr/share/licenses/dolt/ $srcdir/LICENSE
}
