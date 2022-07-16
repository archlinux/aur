# Maintainer: JustKidding <jk@vin.ovh>

pkgname=gminer-bin
_pkgbasename=gminer
pkgver=3.03
pkgrel=1
pkgdesc="Multi currency GPU miner"
arch=("x86_64")
url="https://github.com/develsoftware/GMinerRelease"
source=("${_pkgbasename}-${pkgver}.tar.xz::https://github.com/develsoftware/GMinerRelease/releases/download/${pkgver}/gminer_${pkgver/\./_}_linux64.tar.xz")
sha256sums=('16a9f216dcd35ebfe4b826a65e4ea584385758b8d24a156ac8a437e14fb91c41')
options=('!strip')

package() {
	rm "${_pkgbasename}-${pkgver}.tar.xz"

	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cp -a "$srcdir/"* "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/miner" "$pkgdir/usr/bin/miner"
}

