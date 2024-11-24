# Maintainer: RubenKelevra <ruben@vfn-nrw.de>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=pauker
pkgver=1.9b3
pkgver_dl=1.9Beta3
pkgrel=3
pkgdesc="A flash card based learning tool using shortterm and longterm memory training (no active development)"
arch=('any')
url="http://pauker.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver_dl.jar"
        "icon.svg::https://sourceforge.net/p/pauker/code/ci/master/tree/icon.svg?format=raw"
        "$pkgname.desktop"
        "$pkgname.sh")
noextract=("$pkgname-$pkgver_dl.jar")
sha512sums=('28a34d089af958de9189a0e4ac43d12a2b2188f5e24623dbc02ea7a6897e7a1abfabb18d28cc0a5fd872e518015a460c4e75299a0bc5d91f476f5ad967f634f4'
         '94a95e28931d3e2d33ad942103f5bbd1571a31fd84dfa98f641a842447e733d692c4e108650ed631b63d6589214ecf9418768a7abe0ddbe9f981515fb16bcb8f'
         'SKIP'
         'SKIP')

package () {
	cd "${srcdir}"

	install -D -m644 $pkgname-$pkgver_dl.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
	install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 icon.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
}

