# Maintainer: yuchen_official <yuchen_official_aur at outlook dot com>
# Maintainer: okhsunrog <me@okhsunrog.ru>
# Contributor: another <code § deadcode § eu>

_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2025.01"
pkgrel=3
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('f43cb84dbb23bca2853b5422e28bc03d7b174dd19f41030990fd1e5fdade5234')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
