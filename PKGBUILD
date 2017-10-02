# Contributor: Hy Goldsher aka hyness <hyness-at-gmail>                
# Maintainer: Hy Goldsher aka hyness <hyness-at-gmail>
pkgname=squirrel-sql
pkgver=3.8.0
pkgrel=2
pkgdesc="A Java SQL client for any JDBC compliant database"
arch=('i686' 'x86_64')
url="http://www.squirrelsql.org/"
license=('GPL')
makedepends=('unzip')
depends=('java-runtime')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/squirrel-sql/squirrelsql-$pkgver-optional.zip $pkgname $pkgname.desktop)
install=$pkgname.install
md5sums=('0dc6ba651f57a1ee8b114a3a052a2fe4'
         '13fcedb38028ddafae5d5d4526dad5a3'
         '14f0b383472e67040112c446cd2dc3d4')
package() {
  _src=$srcdir/squirrelsql-$pkgver-optional

  # Create directories
  install -d $pkgdir/usr/share/java/$pkgname/{icons,lib}

  # Create startup script
  install -Dm755 $srcdir/squirrel-sql $pkgdir/usr/bin/squirrel-sql

  # Install files
  install -Dm755 $srcdir/squirrel-sql $pkgdir/usr/bin/squirrel-sql
  install -m644 $_src/{squirrel-sql.jar,*.properties} $pkgdir/usr/share/java/$pkgname/
  install -m755 $_src/{restore,$pkgname}.sh $pkgdir/usr/share/java/$pkgname/
  install $_src/icons/*.* $pkgdir/usr/share/java/$pkgname/icons/
  install $_src/lib/*.* $pkgdir/usr/share/java/$pkgname/lib/
  cp -a $_src/plugins $pkgdir/usr/share/java/$pkgname/

  # Create desktop and icon
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $_src/icons/acorn.xpm $pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.xpm
}

