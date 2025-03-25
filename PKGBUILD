# Maintainer: okhsunrog <me@okhsunrog.ru>
# Contributor: another <code § deadcode § eu>

_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2025.01"
pkgrel=2
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('a4c325d1b534c81f3a154eca2ec89b818334207f36e959738475b69c61241838')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
