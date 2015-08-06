# Maintainer: Javier Tia <javier.tia@gmail.com>
# Contributor:  Javier Vasquez <jevv.cr@gmail.com>
fontsname=hpfonts
pkgname=ttf-$fontsname
pkgver=1.1
pkgrel=2
pkgdesc="Official Hewlett Packard communication fonts, including the reinvented Futura fonts, along with older web/logo fonts."
url="https://hpedia.hp.com/wiki/Fonts"
arch=('any')
license="unknown"
provides=('hpfonts')
source=(http://linuxcoe.corp.hp.com/LinuxCOE/HPCOE/current/Debian/pool/contrib/h/hp/${fontsname}_${pkgver}-${pkgrel}_all.deb)
md5sums=('648332eaa1071b0fbef4cb488078d5ac')
install=$pkgname.install

package() {
	ar x ${fontsname}_${pkgver}-${pkgrel}_all.deb
	tar xf data.tar.gz --no-overwrite-dir -C $pkgdir
	rm -r $pkgdir/usr/share/doc
	rm $pkgdir/usr/share/fonts/hp/fonts.dir
	rm $pkgdir/usr/share/fonts/hp/fonts.scale
	mv $pkgdir/usr/share/fonts/hp $pkgdir/usr/share/fonts/TTF
}
