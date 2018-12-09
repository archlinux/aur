# Maintainer: basigur

pkgname=mate-neru-canta-theme
pkgver=1.6
pkgrel=1
pkgdesc="Neru Canta theme Mate"
arch=(x86_64)
url="https://github.com/chistota/mate-neru-canta-theme"
license=('GPL2')
depends=()
replaces=('mate-neru-canta-theme')
conflicts=()
source=("https://github.com/chistota/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('3A683E604A8DCDD93866AF5175CA689F7B45E7927AA62DB6F7EC2D8780E78A7228FC77A8F2BA38AAB54A54F5201A214883D9ECE108E0DE1DB523ACABFE65938A')

package() {
	tar -xzf v${pkgver}.tar.gz
	cd "$srcdir"/"${pkgname}"-"$pkgver"
	install -d "$pkgdir/usr/share/themes"

	mv Neru-canta-yellow-dark/gtk-assets/Желтые.svg Neru-canta-yellow-dark/gtk-assets/yellow.svg
	mv Neru-canta-yellow-light/gtk-assets/Желтые.svg Neru-canta-yellow-light/gtk-assets/yellow.svg

	install -D -m644 "Neru-canta-blue-dark/COPYING" "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
	install -D -m644 "Neru-canta-blue-dark/AUTHORS" "${pkgdir}"/usr/share/doc/"${pkgname}"/AUTHORS
	rm -f */{AUTHORS,COPYING}

	cp -R {'Neru-canta-blue-dark','Neru-canta-blue-light'} "${pkgdir}"/usr/share/themes/
	cp -R {'Neru-canta-green-dark','Neru-canta-green-light'} "${pkgdir}"/usr/share/themes/
	cp -R {'Neru-canta-yellow-dark','Neru-canta-yellow-light'} "${pkgdir}"/usr/share/themes/

}
