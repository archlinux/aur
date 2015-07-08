# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>

pkgname=jflex
pkgver=1.6.0
pkgrel=1
pkgdesc="A lexer generator written in Java"
arch=('any')
url="http://www.jflex.de/"
license=('GPL')
depends=('java-environment')
changelog='Changelog'
source=(http://jflex.de/$pkgname-$pkgver.tar.gz
        jflex.sh)
md5sums=('df8cc9ca50b549bf705bd23479c100dc'
         '69cd460b4345372103b8301b456cbd1d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m644 -D lib/jflex-${pkgver}.jar \
    "$pkgdir/usr/share/java/$pkgname/jflex.jar"
  install -m644 -D doc/manual.pdf \
    "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
  install -m644 -D lib/jflex.vim \
    "$pkgdir/usr/share/vim/syntax/jflex.vim"
  install -m755 -D "$srcdir/jflex.sh" "$pkgdir/usr/bin/jflex"
}

# vim:set ts=2 sw=2 et:
