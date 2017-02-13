# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=cabanalyst
pkgver=1.0
pkgrel=2
pkgdesc="Ham Radio contesting - Cabrillo log editor"
arch=('i686' 'x86_64')
url="http://hamsoftware.org/old_index.html"
license=('GPL3')
depends=('qt4' 'hamradio-menus')
source=(http://www.hamsoftware.org/${pkgname}_v$pkgver.tgz
	$pkgname.desktop
	$pkgname.png)

build() {
	cd "$srcdir/$pkgname/"
	/usr/lib/qt4/bin/qmake
	make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm 755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname

	install -dm755 "${pkgdir}"/usr/share/doc/$pkgname
	install -m644 testlog.log "${pkgdir}"/usr/share/doc/$pkgname

	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('60672327a5eaa6f597c24f8bce2cdff6'
         '942b749b8ba86b43011389601a82bf76'
         '0c5fc02db4577b3b1ffcc23e5c7a2b8e')
sha256sums=('7df96eb87d248d73b364012e8d10885c98e29f6645a9155934f7f2f6cca64d5e'
            'a8af24312399aff52d91dad72704b50b73443ab95320679a64e378e57db69e88'
            'ae4886c24e08425d7a9d6c31290924f8b328d0b2fe59b3d0c0e94ecf4d62b039')
