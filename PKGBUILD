# Maintainer: Bruno Jacquet <maxijac at free dot fr>

pkgname=gminer-bin
_pkgbasename=gminer
pkgver=2.44
pkgrel=1
pkgdesc="Multi currency GPU miner"
arch=("x86_64")
url="https://github.com/develsoftware/GMinerRelease"
source=("${_pkgbasename}-${pkgver}.zip::https://github.com/develsoftware/GMinerRelease/releases/download/${pkgver}/gminer_${pkgver/\./_}_linux64.zip")
sha256sums=("ee70916cdaa010e27920c1479ee871bdd3ef4e7d1b4bfcd720c2972738024d0e")
options=('!strip')

package() {
	rm "${_pkgbasename}-${pkgver}.zip"

	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/miner" "$pkgdir/usr/bin/miner"
}
