# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=editcp
pkgver=0.11.0
pkgrel=1
pkgdesc="TYT MD380/390, Retivis RT3, & Alinco DJ-MD40 CPS (Ham/Amateur Radio)"
arch=('x86_64')
url="https://www.farnsworth.org/dale/codeplug/editcp/"
license=('GPL3')
depends=('qt5ct' 'libmariadbclient' 'hamradio-menus')
install=editcp.install
source=(https://www.farnsworth.org/dale/codeplug/editcp/downloads/\
linux/$pkgname-$pkgver.tar.xz
	diff.editcp.sh
	$pkgname.1
        $pkgname.desktop
        $pkgname.png)

prepare () {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.editcp.sh
}

package() {
	cd $srcdir/$pkgname-$pkgver

	install -d $pkgdir/usr/share/$pkgname

	cp -a * $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop \
	 $pkgdir/usr/share/applications/.
}
md5sums=('25c05bc4ca66eeccd065d83e3b04aa74'
         '188b84c0e898c1676d0c68f477bf3a38'
         '6c9b1f8f43dedb505699b4648cc558a5'
         'b34c7acc62e7a50dad4ec0dd0a0bbabe'
         '0c5fc02db4577b3b1ffcc23e5c7a2b8e')
sha256sums=('fed1ad40aabf69aa04c6f2411994c28c4863bf2a07b959aaec1a78c9b8916577'
            '67a26f228506aca303cf1170a7612d9c18d7713ec88cc48f4653c9748227fc34'
            '9822a5e7f7fc179c6a1b98f5886797d91dd0d0d82e465a0a812e445539e9f2f4'
            '1f8bdcc1a5bd7eb58891ffc019e9d7672cb0de8b112702cb194abcb6abed9b39'
            'ae4886c24e08425d7a9d6c31290924f8b328d0b2fe59b3d0c0e94ecf4d62b039')
