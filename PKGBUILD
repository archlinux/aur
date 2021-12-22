# Maintainer: Bruno Jacquet <maxijac at free dot fr>

pkgname=teamredminer-bin
_pkgbasename=teamredminer
pkgver=0.9.0
pkgrel=1
pkgdesc="Optimized miner for AMD GPUs"
arch=("x86_64")
url="https://github.com/todxx/teamredminer"
source=("${_pkgbasename}-${pkgver}.tgz::https://github.com/todxx/teamredminer/releases/download/v${pkgver}/teamredminer-v${pkgver}-linux.tgz")
sha256sums=("b11d76076d34fd4e7270caa342db97fd5bc9d49b8f699001c1e5a7f62a9593f7")
options=('!strip')

package() {
	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/teamredminer-v$pkgver-linux/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/teamredminer" "$pkgdir/usr/bin/teamredminer"
}
