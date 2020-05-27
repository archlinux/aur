# Contributor: Hy Goldsher <hyness-at-freshlegacycode-dot-org>                
# Maintainer: Hy Goldsher <hyness-at-freshlegacycode-dot-org>
pkgname=squirrel-sql
pkgver=4.1.0
pkgrel=1
pkgdesc="A Java SQL client for any JDBC compliant database"
arch=('i686' 'x86_64')
url="http://www.squirrelsql.org/"
license=('GPL')
makedepends=('unzip')
depends=('java-runtime')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/squirrel-sql/squirrelsql-$pkgver-optional.zip $pkgname $pkgname.desktop)
install=$pkgname.install
md5sums=('6aec1434b64f77534b38772b89d1b4a1'
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

