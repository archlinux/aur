#Maintainer:anon at sansorgan.es 

pkgname=molecular-workbench
pkgdesc='Modeling tool for designing and conducting computational experiments across science.'
pkgver=3.0.0
pkgrel=4
arch=('any')
url="http://mw.concord.org"
license=(CCPL)
depends=('java-environment' 'bash')
source=("http://mw.concord.org/modeler/cd.zip"
	"$pkgname.png"
	"$pkgname"
	"$pkgname.desktop")
md5sums=('064455ffeae68820721276f679699dc0'
         'f75e594817e24d18beadfbc500132ea7'
         '76f5f16a79562d8a50372acb0280f941'
         '784c824346606bd1c49b5e504b97a118')

package() {
	cd "$srcdir"
	install -Dm 0644 cd/mw.jar "$pkgdir/usr/share/java/$pkgname/mw.jar"
	cp -r cd/CC-MW-CD "$pkgdir/usr/share/java/$pkgname/CC-MW-CD"
	install -Dm 0755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm 0644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm 0644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

