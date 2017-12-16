# Maintainer: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgname=scala-dotty
pkgver=0.5.0_RC1
_pkgverWithHyphen=${pkgver//_/-}
pkgrel=1
pkgdesc='A platform to try out new language concepts and compiler technologies for Scala'
arch=('any')
url='http://dotty.epfl.ch'
license=('BSD')
depends=('java-environment=8')
source=("https://github.com/lampepfl/dotty/releases/download/$_pkgverWithHyphen/dotty-$_pkgverWithHyphen.tar.gz")
sha1sums=('4c39b81f54f6b663da60ab90f9ddb5d28a2da670')

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/scala-dotty"
	cp -r "$srcdir/dotty-$_pkgverWithHyphen/bin" "$pkgdir/opt/scala-dotty"
	cp -r "$srcdir/dotty-$_pkgverWithHyphen/lib" "$pkgdir/opt/scala-dotty"
	ln -s "/opt/scala-dotty/bin/dotc" "$pkgdir/usr/bin/dotc"
	ln -s "/opt/scala-dotty/bin/dotd" "$pkgdir/usr/bin/dotd"
	ln -s "/opt/scala-dotty/bin/dotr" "$pkgdir/usr/bin/dotr"
}
