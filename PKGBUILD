# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=xed-bin
_pkgname=xed
pkgver=1.0.6
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project."
url='https://github.com/linuxmint/xed'

arch=('x86_64' 'i686')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("http://packages.linuxmint.com/pool/main/x/${_pkgname}/${_pkgname}-common_${pkgver}+betsy_all.deb")
source_x86_64=("http://packages.linuxmint.com/pool/main/x/${_pkgname}/${_pkgname}_${pkgver}+betsy_amd64.deb")
source_i686=("http://packages.linuxmint.com/pool/main/x/${_pkgname}/${_pkgname}_${pkgver}+betsy_i386.deb")

md5sums=('da41151893e4809c44696de35ef0b4a8')
md5sums_x86_64=('dc55b46363b13e8eb42591c48c44a405')
md5sums_i686=('12efcfd2bf5bc27dd8888f4e11eefc6b')

noextract=('${_pkgname}*.deb')

package() {
	bsdtar -Oxf $srcdir/${_pkgname}_${pkgver}*.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
	bsdtar -Oxf $srcdir/${_pkgname}-common_${pkgver}*.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
	rm -rf $pkgdir/usr/share/doc
}


