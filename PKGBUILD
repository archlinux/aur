# Maintainer: Seishinryohosha <seishinryohosha @ googlemail . com>
# Contributor: even
pkgname=greenfoot
pkgver=2.4.2
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
sha256sums=('07618c3f2e7d19863b52f4c2eb6bcc875a908147836c992c854eb88c404f0754'
            '16f8bf45c11bd5abe50a672082ed0b3e6da2cb09b89c91a5cdde6459f500475b'
            'd302cfba475646f7030c8353be8637e1601b1ec512a07cbdf936793ff67338d8')

package() {
  cd "$srcdir"
  bsdtar -x -f "greenfoot-dist.jar"
  mkdir -p "$pkgdir"/usr/share/{java,greenfoot}
  cp -r lib "$pkgdir/usr/share/java/greenfoot/"
  cp -r scenarios "$pkgdir/usr/share/greenfoot/"
  cp -r doc "$pkgdir/usr/share/greenfoot/"
  install -Dm644 greenfoot.desktop "$pkgdir/usr/share/applications/greenfoot.desktop"
  install -Dm755 greenfoot "$pkgdir/usr/bin/greenfoot"
}
