# Maintainer: PyroPeter <abi1789 @ googlemail . com>
# Contributor: DarkHeart <fumbles@ymail.com>
pkgname=bluej
pkgver=3.1.5
pkgrel=1
pkgdesc="An integrated Java environment specifically designed for introductory teaching"
arch=('any')
url="http://www.bluej.org"
license=('GPL2' 'BSD')
depends=('sh' 'java-runtime' 'java-environment')
makedepends=('libarchive')
source=(http://www.bluej.org/download/files/bluej-${pkgver//.}.jar
        bluej
        bluej.desktop)
md5sums=('e734dc61473e6d8cab315c6497eb871b'
         '94b9bc934a337ed44e2239dd362520f6'
         '6cfbab36d21971e09bd0dc8a470c52e5')

package() {
  cd "$srcdir"
  bsdtar -x -f "bluej-dist.jar"
  mkdir -p "$pkgdir"/usr/share/{java,bluej}
  cp -r lib "$pkgdir/usr/share/java/bluej"
  cp -r examples "$pkgdir/usr/share/bluej/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/bluej/license.txt"
  install -Dm644 THIRDPARTYLICENSE.txt "$pkgdir/usr/share/licenses/bluej/thirdpartylicense.txt"
  install -Dm644 bluej.desktop "$pkgdir/usr/share/applications/bluej.desktop"
  install -Dm755 bluej "$pkgdir/usr/bin/bluej"
}
