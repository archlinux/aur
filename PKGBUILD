# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=qchdman
pkgver=0.195
pkgrel=1
pkgdesc="QMC2's Qt chdman interface. A Qt interface for chdman utility."
arch=('i686' 'x86_64')
	if [[ "$CARCH" == "i686" ]]; then
		_ARCH_="i386"
	elif [[ "$CARCH" == "x86_64" ]]; then
		_ARCH_="amd64"
	fi
url="http://qmc2.batcom-it.net"
license=('GPL2')
depends=('qt4>=4.8.0' 'mame-tools')
source=("http://www.deb-multimedia.org/pool/main/q/qmc2-dmo/${pkgname}_${pkgver}-dmo1_${_ARCH_}.deb" "http://svn.code.sf.net/p/qmc2/code/trunk/tools/qchdman/images/qchdman.png")
sha512sums=('SKIP' 'SKIP')
			
package(){

	tar xf data.tar.xz 
	mkdir -p "usr/share/qmc2/img"
	cd ..
	mv "qchdman.png" "${srcdir}/usr/share/qmc2/img/"
	cd "${srcdir}"
	cp -r usr "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc/${pkgname}/copyright"
	rm -rf "qchdman.png"
	install -D -m644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	msg2 "\e[1;32m 'mame-tools package' provides /usr/bin/chdman to be used as the chdman binary path \e[0m"

}
