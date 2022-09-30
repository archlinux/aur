# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.50.0
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
sha256sums_x86_64=('a30d653b036901c44ba0fa5c6cb67d5d62e70e4e5a17c1d9249fdee40ab56228'
                   'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('52f98f9127c0216c191bbfc83dd57c1671a70e58bc5fde0aa4e9232d1754d4e9'
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
