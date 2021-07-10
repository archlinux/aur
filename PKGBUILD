# Maintainer: Bruno Jacquet <maxijac at free dot fr>

pkgname=gminer-bin
_pkgbasename=gminer
pkgver=2.60
pkgrel=1
pkgdesc="Multi currency GPU miner"
arch=("x86_64")
url="https://github.com/develsoftware/GMinerRelease"
source=("${_pkgbasename}-${pkgver}.tar.xz::https://github.com/develsoftware/GMinerRelease/releases/download/${pkgver}/gminer_${pkgver/\./_}_linux64.tar.xz")
sha256sums=("4e612cf0f269982160d179dc4e1a349513db871b458111ab1fb6639c20c73d1a")
options=('!strip')

package() {
	rm "${_pkgbasename}-${pkgver}.tar.xz"

	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/miner" "$pkgdir/usr/bin/miner"
}
