# Maintainer: another <code § deadcode § eu>
_pkgname=u-boot-qemu
pkgname=${_pkgname}-bin
pkgver="2022.10"
_pkgversuffix="+dfsg-1"
pkgrel=1
pkgdesc="U-Boot for qemu"
arch=('any')
url="https://www.denx.de/wiki/U-Boot/"
license=('GPL2')
options=('!strip')
source=("https://deb.debian.org/debian/pool/main/u/u-boot/${_pkgname}_${pkgver}${_pkgversuffix}_all.deb")
sha256sums=('a916bdc2d522e5ce38c6f6fc7268cf09102108a690c4354d2da0c9de2b87cbff')
sha512sums=('92388fdb4a910e889f35cec274509416a01a2c1b387af703fe0769354ad59fc8ec32543db05e1bc5c18cdb56606bc4c6259d84b8087ea7129229537c57e658fb')
b2sums=('1317e4fc70606d604d0c60394e104ffe98028f104b2b8fb17dc5af1d9facc886c24bb4c0eafde12605487992546c5d77caacc060ec1360a544722926d4817e02')

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz"
	cd "${pkgdir}"
	mv ./usr/lib/u-boot/ ./usr/share/${pkgname}
	mv ./usr/share/doc/u-boot-qemu/ ./usr/share/doc/${pkgname}
	rm -rf ./usr/lib/ ./usr/share/lintian/
}
