# Maintainer: Antoine Viallon <antoine@lesviallon.fr>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>

pkgname=jflex
pkgver=1.8.2
pkgrel=1
pkgdesc="A lexer generator written in Java"
arch=('any')
url="http://www.jflex.de/"
license=('GPL')
depends=('java-environment' 'bash')
changelog='Changelog'
source=(https://github.com/jflex-de/jflex/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        jflex.sh)
md5sums=('d4b11d1679b14a3cb18c22e08bb8641e'
         '69cd460b4345372103b8301b456cbd1d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m644 -D lib/${pkgname}-full-${pkgver}.jar \
    "$pkgdir/usr/share/java/$pkgname/jflex.jar"
  install -m644 -D doc/manual.pdf \
    "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
  install -m644 -D lib/jflex.vim \
    "$pkgdir/usr/share/vim/syntax/jflex.vim"
  install -m755 -D "$srcdir/jflex.sh" "$pkgdir/usr/bin/jflex"
}

# vim:set ts=2 sw=2 et:
