# Maintainer: another <code § deadcode § eu>
_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2023.01"
_pkgversuffix="+dfsg-2"
pkgrel=1
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}${_pkgversuffix}_all.deb")
sha256sums=('3db349c5543d10b28a29dfef4a361abaced7402f4d48407304422acc3472cd44')
sha512sums=('ab105b0326a4f17232687bdfb85ef2788389aa653b4bb4dfccc99213306b09975f3d884799d5511fa7e3aac4cad1f5b33ed6cf7129db74756ab4490fc684751c')
b2sums=('803602a2fed0e2af316ba17c0f3d256e1457e40e5783359320b66191128041a2681c45728477edd17ececd4acc1c1c1a588d2b991aa4523a7a3f9b963f12168b')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
