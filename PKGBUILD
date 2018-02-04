#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=5up-bin
pkgver=1.7.0
pkgrel=2
pkgdesc='Handy screenshot making tool. Take screenshots, crop them, draw on
 them by using built-in editor and share your screenshots over the Internet by
 instant upload to img.5cm.ru image hosting server.'
arch=('x86_64')
url='http://img.5cm.ru/'
license=('GPL')
depends=('qt4')
options=(!strip)

source=("http://5cm.ru/5up/installers/deb64/5up_${pkgver}_amd64.deb")
sha256sums=('903fb07b86e729364b706d2bb629fe3d680eb509fde3d01a639d4178fe6f4f1b')
md5sums=('61871c0cbd74176da47235dc0f732160')

prepare() {

  tar -xf data.tar.gz -C "$srcdir"
}

package() {
  install -dm 755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -dm 755 "$pkgdir/usr/bin/"
   
  install -Dm 755 "$srcdir"/usr/share/doc/5up/copyright "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm 755 "$srcdir/usr/bin/5up" "$pkgdir"/usr/bin/  
}
   
