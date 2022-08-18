# Maintainer: another <code § deadcode § eu>
_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2022.07"
_pkgversuffix="+dfsg-1"
pkgrel=1
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}${_pkgversuffix}_all.deb")
sha256sums=('2c5f4488124c314397ffca97b800d0d4b05fb340a2df5298fb417517fb51b7b0')
sha512sums=('9b15258652b0a5694a99e13c05f629476beba47407d6c555765c7ad810f0b98fed620fd0857b1f7496a88d36ea9a49d91680b5da24912573b56ed7e852ab2404')
b2sums=('01196eba22d833a9651afe9d48fca21fb30d588090bc45635eb948978e918e7c5d6a9233cdd27e69594ffee8c47f4197e42962e626eb6a3445ebf7713d2fb22d')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
