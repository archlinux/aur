pkgname=tuprolog
pkgver=3.0.1
pkgrel=1
pkgdesc='A light-weight Prolog system for distributed applications and infrastructures.'
arch=('any')
url='http://apice.unibo.it/xwiki/bin/view/Tuprolog/'
license=('LGPL')
depends=('java-runtime')
source=("https://bitbucket.org/tuprologteam/tuprolog/downloads/2p-$pkgver.zip"
        '2p'
        '2p.desktop')
sha256sums=('7f9a382d6c8dd968626362e8b72f406886459d638d88a4ea590b04598148e03a'
            'b817724b0e860ee579606f67cbcb10487d3bd46d66dc5e910aaa671f5656db03'
            'f6d433993a53c209fbbf38b3e9b9dc47e6fa7bdf5d1234938d74e287af84da51')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/doc/tuprolog"
  cp -dpr --no-preserve=ownership "2p-$pkgver/doc/examples" "2p-$pkgver/doc/javadoc" "$pkgdir/usr/share/doc/tuprolog/"

  install -d "$pkgdir/usr/share/java/tuprolog"
  install -m644 "2p-$pkgver/bin/2p.jar" "2p-$pkgver/bin/tuprolog.jar" "$pkgdir/usr/share/java/tuprolog/"

  install -Dm755 2p "$pkgdir/usr/bin/2p"
  install -Dm644 2p.desktop "$pkgdir/usr/share/applications/2p.desktop"
}
