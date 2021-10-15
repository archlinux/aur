# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=tiup-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A component manager for TiDB"
arch=(x86_64)
url="https://github.com/pingcap/tiup"
license=('Apache-2')

conflicts=('tiup' 'tiup-git')
provides=('tiup')

source=("https://github.com/pingcap/tiup/releases/download/v${pkgver}/tiup-v${pkgver}-linux-amd64.tar.gz")

sha256sums=('SKIP')

package() {
	# package
	for bin in $srcdir/bin/tiup*; do
		echo $bin
		install -D -m755 $bin $pkgdir/usr/bin/$bin
	done
}
