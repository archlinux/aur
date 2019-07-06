# Maintainer: basigur

pkgname=mate-neru-canta-theme
pkgver=1.6
pkgrel=2
pkgdesc="Neru Canta theme Mate"
arch=(x86_64)
url="https://github.com/chistota/mate-neru-canta-theme"
license=('GPL2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chistota/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('3a683e604a8dcdd93866af5175ca689f7b45e7927aa62db6f7ec2d8780e78a7228fc77a8f2ba38aab54a54f5201a214883d9ece108e0de1db523acabfe65938a')

prepare() {
   cd "${pkgname}"-"${pkgver}"
     mv Neru-canta-yellow-dark/gtk-assets/Желтые.svg Neru-canta-yellow-dark/gtk-assets/yellow.svg
     mv Neru-canta-yellow-light/gtk-assets/Желтые.svg Neru-canta-yellow-light/gtk-assets/yellow.svg
     sed -i 's!#1F91E0!#7dc842!' Neru-canta-green-light/gtk-2.0/gtkrc
     sed -i 's!#1F91E0!#7dc842!' Neru-canta-green-dark/gtk-2.0/gtkrc
     sed -i 's!#1F91E0!#F5CE46!' Neru-canta-yellow-light/gtk-2.0/gtkrc
}

package() {
	cd "${pkgname}"-"${pkgver}"
	install -d "${pkgdir}/usr/share/themes"
	install -Dm 0644 "Neru-canta-blue-dark/COPYING" "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
	install -Dm 0644 "Neru-canta-blue-dark/AUTHORS" "${pkgdir}"/usr/share/doc/"${pkgname}"/AUTHORS
	rm -f */{AUTHORS,COPYING}
	cp -R */ "${pkgdir}/usr/share/themes"
}

