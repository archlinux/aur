# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Martin Zeller <mz DOT bremerhaven AT gmail DOT com>
pkgname=grgen
_pkgname=GrGenNET
pkgver=6.1.1
_pkgdate=2021-08-28
pkgrel=1
pkgdesc="transformation of structures made easy"
arch=('x86' 'x86_64')
url="http://www.info.uni-karlsruhe.de/software/grgen/"
license=('GPL')
depends=('mono' 'java-environment')
_zipname="${_pkgname}-V$pkgver-${_pkgdate}"
source=( "http://www.info.uni-karlsruhe.de/software/$pkgname/${_zipname}.tar.bz2"
         "GrGen"
		 "GrShell"
		 "yComp"
       )
md5sums=('965c2ffdf7a6eb0fb7c176774ff7d7ad'
         '695171fa276683633b7dfaab8ac26004'
         '6d4ff6d37659028c4f370b9446b391d8'
         '941a530ada35ef0f7bce7ae3bfff61f5')

package() {
	mkdir -p "$pkgdir/usr/lib"
	cp -r "$srcdir/${_zipname}/bin" "$pkgdir/usr/lib/grgen"

	install -Dm755 "GrGen" "$pkgdir/usr/bin/GrGen"
	install -Dm755 "GrShell" "$pkgdir/usr/bin/GrShell"
	install -Dm755 "yComp" "$pkgdir/usr/bin/yComp"
}
