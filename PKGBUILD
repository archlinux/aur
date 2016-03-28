# Maintainer: Mike Barkmin <mbarkmin@gmail.com>
pkgname=jeliot
pkgver=3.7.2
pkgrel=1
pkgdesc="Visualization application. It visualizes how a Java program is interpreted."
arch=('any')
url="https://cs.joensuu.fi/jeliot/"
license=('GPL2' 'BSD')
depends=('sh' 'java-runtime' 'java-environment')
makedepends=('libarchive')

source=(http://cs.joensuu.fi/jeliot/downloads/jeliot$pkgver/Jeliot$pkgver.zip
        jeliot
        jeliot.desktop
        jeliot.png)
md5sums=('b0e27a18eee56f5aaaadbb68974bc6b8'
         '6a147f0478c73e897dd834818b1c3c8e'
         '873ae0341bf0a1bc22cd7aff85dd6217'
         '9a48b3fb91fa23ce2ed9f5057f31493d')

package() {
  cd "$srcdir"
  bsdtar -x -f "Jeliot$pkgver.zip"
  mkdir -p "$pkgdir"/usr/share/jeliot
  mkdir -p "$pkgdir"/usr/share/java/jeliot
  cp jeliot.jar "$pkgdir/usr/share/java/jeliot/"
  cp jeliot.png "$pkgdir/usr/share/java/jeliot/"
  cp -r docs "$pkgdir/usr/share/jeliot/"
  cp -r examples "$pkgdir/usr/share/jeliot/"
  cp quicktutorial.pdf "$pkgdir/usr/share/jeliot/"
  cp userguide.pdf "$pkgdir/usr/share/jeliot/"
  install -Dm644 jeliot.desktop "$pkgdir/usr/share/applications/jeliot.desktop"
  install -Dm755 jeliot "$pkgdir/usr/bin/jeliot"
}
