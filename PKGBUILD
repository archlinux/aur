# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=konduit
_pkgname=KonduitLauncher
pkgver=1.38.1
pkgrel=1
pkgdesc="The performant, safe and innovative toolkit for Oldschool RuneScape"
arch=('any')
url="https://konduit.io"
license=('custom')
depends=('java-runtime')
source=("http://cdn.konduit.io/$_pkgname.jar"
		"konduit"
		"LICENSE")
noextract=("KonduitLauncher.jar")
md5sums=('98df4beb1ecf48b2d8d1c5dbf6f1ec0c'
         '0c2072207852f157d309997dafdd4597'
         '4f571f55d94544a09daf748c5eaa0a23')

package()
{
	cd "$srcdir"
	msg2 "Installing jar"
	mkdir -p "$pkgdir/usr/share/java/$pkgname"
	install -Dm644 "$_pkgname.jar" "$pkgdir/usr/share/java/$pkgname"

	msg2 "Installing executable"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
