#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=5up-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='Handy screenshot making tool. Take screenshots, crop them, draw on
 them by using built-in editor and share your screenshots over the Internet by
 instant upload to img.5cm.ru image hosting server.'
arch=('x86_64')
url='http://img.5cm.ru/'
license=('GPL')
depends=('glibc' 'qt4')
options=(!strip)
validpgpkeys=('BC02894E554D22A62D381930300E89650A716A5A')
source=("https://www.dropbox.com/s/osvw05faudyza5t/5up.deb"
        "5up.deb.sig")
sha256sums=('903fb07b86e729364b706d2bb629fe3d680eb509fde3d01a639d4178fe6f4f1b'
           'SKIP')
md5sums=('61871c0cbd74176da47235dc0f732160'
          'SKIP')
prepare() {

  tar -xf data.tar.gz -C "$srcdir"
}

package() {
  install -dm 755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -dm 755 "$pkgdir/usr/bin/"
   
  install -Dm 755 "$srcdir"/usr/share/doc/5up/copyright "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm 755 "$srcdir/usr/bin/5up" "$pkgdir"/usr/bin/  
}
   
