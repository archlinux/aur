# Maintainer: Seishinryohosha <seishinryohosha @ googlemail . com>
# Contributor: even
pkgname=greenfoot
pkgver=3.0.2
pkgrel=2
pkgdesc="Allows easy development of two-dimensional graphical applications, such as simulations and interactive games."
arch=('any')
url="http://www.greenfoot.org"
license=('GPL2' 'BSD')
depends=('sh' 'java-runtime' 'java-environment')
makedepends=('libarchive')
source=(http://www.greenfoot.org/download/files/Greenfoot-generic-${pkgver//.}.jar
        greenfoot
        greenfoot.desktop)
sha256sums=('53c24cf7c303b28064b70048094a6cc2a1889b634493fa31d7ce4c522403d66d'
            
'3cd41fd670bc6b2c0dfe0159979ee9162b980154bf43f65289e474e06765d9a0'
            
'd302cfba475646f7030c8353be8637e1601b1ec512a07cbdf936793ff67338d8')
package() {
  cd "$srcdir"
  bsdtar -x -f "greenfoot-dist.jar"
  mkdir -p "$pkgdir"/usr/share/{java,greenfoot}
  cp -r lib "$pkgdir/usr/share/greenfoot/"
  cp -r scenarios "$pkgdir/usr/share/greenfoot/"
  cp -r doc "$pkgdir/usr/share/greenfoot/"
  install -Dm644 greenfoot.desktop "$pkgdir/usr/share/applications/greenfoot.desktop"
  install -Dm755 greenfoot "$pkgdir/usr/bin/greenfoot"
}
