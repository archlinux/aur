# Maintainer: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgname=scala-dotty
pkgver=0.12.0
_pkgverWithHyphen=${pkgver//_/-}
pkgrel=1
pkgdesc='A platform to try out new language concepts and compiler technologies for Scala'
arch=('any')
url='http://dotty.epfl.ch'
license=('BSD')
depends=('java-environment=8')
source=("https://github.com/lampepfl/dotty/releases/download/$_pkgverWithHyphen/dotty-$_pkgverWithHyphen.tar.gz")
sha1sums=('1a62c5459f0294c08a221aa5ebb197ab9bb83978')

package() {
       mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/scala-dotty"
       cp -r "$srcdir/dotty-$_pkgverWithHyphen/bin" "$pkgdir/usr/share/scala-dotty"
       cp -r "$srcdir/dotty-$_pkgverWithHyphen/lib" "$pkgdir/usr/share/scala-dotty"
       ln -s "/usr/share/scala-dotty/bin/dotc" "$pkgdir/usr/bin/dotc"
       ln -s "/usr/share/scala-dotty/bin/dotd" "$pkgdir/usr/bin/dotd"
       ln -s "/usr/share/scala-dotty/bin/dotr" "$pkgdir/usr/bin/dotr"
}
