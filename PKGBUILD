# Maintainer: another <code § deadcode § eu>
_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2022.04"
_pkgversuffix="+dfsg-2"
pkgrel=1
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}${_pkgversuffix}_all.deb")
sha256sums=('a7458375b012b7fcab1e816a577f83643529da2e32f5169a73afb9de05ddb415')
sha512sums=('eff2e1f833132fd8a6489fe6190c0da16aa8ba715669de1da41ce40eed24250ba8b4b3bb5f4ed79af050e2f4bd35d4c72b49bdded23eceb4053b87a5ab5c6eb3')
b2sums=('b09247c498d5320623785b5076de101062248fc95c1661a3c15df000a701f6ab9776c9784a861549504c4278915b90583f432f9f6055a64b3720e071ace9cd3e')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${_pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
