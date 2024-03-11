# Maintainer: okhsunrog <me@okhsunrog.ru>
# Contributor: another <code § deadcode § eu>

_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2024.01"
_pkgversuffix="+dfsg-1"
pkgrel=1
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}${_pkgversuffix}_all.deb")
sha256sums=('76075c2c47da392807bce444dcaa6cb89d0259c0eefa6410143a78435dcfd442')
sha512sums=('17a6a0dea3cfcdaa61001b23b1d2bb7926b6da7c346495e8c5648c5d7d50e0e7d39f9c58c1008bcc13ffe9a29d29d0fab91a19907e078f744402f9f2a329fac2')
b2sums=('91de7c7b2870505fc8066f8c02a598df75c5e376104b12b70eb31f8ba621660d25be81d123c84639d9d545094ad254f0fdc2a578c1c160bf82b03920d4e50e98')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
