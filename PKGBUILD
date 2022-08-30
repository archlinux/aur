# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.40.30
pkgrel=4
pkgdesc='Git for data!'
arch=('x86_64' 'aarch64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source_x86_64=("https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz"
		"LICENSE")
sha256sums_x86_64=('1e8d015e0b8d76f9ef4c3560a3da45a7e3c7b242ed9ea97114c37447e0c4edd5'
                   'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('9702483abea091d46c61fb094bccec61c81b1464824dff18980950fe0bf00511'
                    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
source_aarch64=("https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-arm64.tar.gz"
		"LICENSE")

#prepare() {
#	mkdir -p $srcdir/dolt-linux
#	if [ "$CARCH" = 'x86_64' ]
#	then
#		_arch='amd64'
#	elif [ "$CARCH" = 'aarch64' ]
#	then
#		_arch='arm64'
#	fi
#	bsdtar -xvf "$srcdir/dolt-linux-$_arch.tar.gz" --directory="$srcdir/dolt-linux" --strip-components=1
#}

package() {
	if [ "$CARCH" = 'x86_64' ]
	then
		_arch='amd64'
	elif [ "$CARCH" = 'aarch64' ]
	then
		_arch='arm64'
	fi

	install -D -t $pkgdir/usr/bin/ $srcdir/dolt-linux-$_arch/bin/dolt
	install -Dm644 -t $pkgdir/usr/share/licenses/dolt/ $srcdir/LICENSE
}
