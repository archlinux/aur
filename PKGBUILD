# Maintainer: JustKidding <jk@vin.ovh>

pkgname=gminer-bin
_pkgbasename=gminer
pkgver=3.43
pkgrel=1
pkgdesc="Multi currency GPU miner"
arch=("x86_64")
url="https://github.com/develsoftware/GMinerRelease"
source=("${_pkgbasename}-${pkgver}.tar.xz::https://github.com/develsoftware/GMinerRelease/releases/download/${pkgver}/gminer_${pkgver/\./_}_linux64.tar.xz")
sha256sums=('bc787eb9b363d6ceda067f4dc58a4de7b953f304aeb9f2355ba330afe9209699')
options=('!strip')

package() {
	rm "${_pkgbasename}-${pkgver}.tar.xz"

	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/miner" "$pkgdir/usr/bin/miner"
}

