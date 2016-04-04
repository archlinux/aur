# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=ida-demo
_pkgname=${pkgname/-/}
pkgver=6.9
_pkgver=${pkgver/./}
pkgrel=1
pkgdesc="IDA is a multi-processor disassembler and debugger"
arch=('i686' 'x86_64')
license=('custom:IDA License Agreement')
url="https://www.hex-rays.com/products/ida/"
depends_i686=('qt4')
depends_x86_64=('lib32-qt4')
source=("https://out7.hex-rays.com/files/${_pkgname}${_pkgver}_linux.tgz")
sha1sums=('3bdf6706520f1ff04dd88e2c2f467f3090e8e6ea')
install='ida-demo.install'

package() {
	mkdir ${pkgdir}/opt/
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/ida-demo/

	cp ${srcdir}/../ida.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
	cp ${srcdir}/../ida-demo.desktop ${pkgdir}/usr/share/applications/
	cp ${srcdir}/idademo68/license.txt ${pkgdir}/usr/share/ida-demo/LICENSE
	mv ${srcdir}/idademo68 ${pkgdir}/opt/ida-demo
}
