pkgname=jape
pkgver=7_d14
pkgrel=1
pkgdesc='A configurable, graphical proof assistant.'
arch=('i686' 'x86_64')
url='http://japeforall.org.uk/'
license=('GPL')
depends=('java-runtime')
source=('jape'
        'jape.desktop')
sha256sums=('43cfa222c48f819c9c4508f4847212d4327f8c7aa49ba4f3bfc9dc4f0f330f8d'
            '4677512343900e325f763cf79c8571ae3e493d7f074ebc7c68182ef487e6e579')
source_i686=("http://www.cs.ox.ac.uk/people/bernard.sufrin/personal/jape.org/BUILDS/$pkgver/Install32bitLinuxjape.jar")
sha256sums_i686=('ab00be7518d418a8ace5e1ccfe8101d52952a41e42d872e448647657d7c90e98')
source_x86_64=("http://www.cs.ox.ac.uk/people/bernard.sufrin/personal/jape.org/BUILDS/$pkgver/InstallLinuxjape.jar")
sha256sums_x86_64=('d82a9dc50f4b2d9e0994db21bdc1979b28dd25ff88acb4f459d24c157329dca4')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/jape"
  install -m755 jape_engine "$pkgdir/usr/share/jape/"
  install -m644 README-UNIX README_encoder.txt "$pkgdir/usr/share/jape/"
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/jape/"

  install -d "$pkgdir/usr/share/java/jape"
  install -m644 Jape.jar encoder.jar "$pkgdir/usr/share/java/jape/"

  install -Dm755 jape "$pkgdir/usr/bin/jape"
  install -Dm644 jape.desktop "$pkgdir/usr/share/applications/jape.desktop"
}
