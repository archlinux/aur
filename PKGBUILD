# Maintainer: Kisuke <kisuke at kisuke dot cz>

pkgname=trolcommander
pkgver=0.9.8
pkgrel=1
pkgdesc='Lightweight, cross-platform file manager written in Java'
arch=('any')
url='https://github.com/trol73/mucommander'
license=('GPL3')
provides=('trolcommander')
depends=('java-runtime>=8')
source=("https://github.com/trol73/mucommander/releases/download/v${pkgver}/${pkgname}_${pkgver}_all.deb")
sha256sums=('43901c1df4756a05533f9278330bbe77f4041a97f34c47327b811ad8a0fc90ad')

package() {
	# Install
	tar xfz ${srcdir}/data.tar.gz -C ${pkgdir}

	# Fix App name and command
	sed -i 's/muCommander/trolCommander/g' ${pkgdir}/usr/share/applications/trolcommander.desktop
	sed -i 's/mucommander/trolcommander/g' ${pkgdir}/usr/share/applications/trolcommander.desktop

	mkdir -p ${pkgdir}/usr/bin
	ln -s /usr/share/trolcommander/trolcommander.sh ${pkgdir}/usr/bin/trolcommander
}
