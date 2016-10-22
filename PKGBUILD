# Maintainer: Carlos Silva <r3pek@r3pek.org>
# Contributor: hcb

pkgname=ida-demo
_pkgname=${pkgname/-/}
pkgver=6.95
_pkgver=${pkgver/./}
pkgrel=3
pkgdesc="IDA is a multi-processor disassembler and debugger"
arch=('i686' 'x86_64')
license=('custom:IDA License Agreement')
url="https://www.hex-rays.com/products/ida/"
depends_i686=('qt4')
depends_x86_64=('lib32-qt4')
source=("https://out7.hex-rays.com/files/${_pkgname}${_pkgver}_linux.tgz"
		"ida.png"
		"ida-demo.desktop")
sha1sums=('356887e8f12fadda2b3c569328f74a6229d31d6e'
          'c123f8ea59daff6da3d8d1792edcb20f66837827'
          'a5e2bf817e043449212018d842d85408e3643b12')

package() {
	mkdir ${pkgdir}/opt/
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/ida-demo/

	cp ${srcdir}/../ida.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
	cp ${srcdir}/../ida-demo.desktop ${pkgdir}/usr/share/applications/
	cp ${srcdir}/idademo${_pkgver}/license.txt ${pkgdir}/usr/share/ida-demo/LICENSE
	mv ${srcdir}/idademo${_pkgver} ${pkgdir}/opt/ida-demo
}
