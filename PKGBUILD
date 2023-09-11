# Maintainer: another <code § deadcode § eu>
_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2023.07"
_pkgversuffix="+dfsg-1"
pkgrel=1
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}${_pkgversuffix}_all.deb")
sha256sums=('20a1448fef8e307a0aa7115e6914fd3401b9124cde7f6dd2f0766ac56c7bfb0b')
sha512sums=('9ec5b12b412106cbc026240a65afbfd21e91ae212622092c2f2b667a1b7952435173c1b06529df3e9e4c46ae3b97d5dd8bcba942a1a7b6a7eb868960f59cdff6')
b2sums=('7c4bbf13450d797e975d4f0a58825bc608095ddff1df6db0c38085ead6c505949559cac13105b03b63e7d4f5af48f926e2af85f17ebcff10f32e7d991b7a44d9')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
