# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=pysolo
pkgver=1.0.1
pkgrel=1
pkgdesc="A software for sleep analysis in Drosophila"
arch=('i686' 'x86_64')
depends=('python2' 'wxpython' 'python2-scipy' 'python2-numpy' 'python2-matplotlib')
url="http://www.pysolo.net"
license=('GPL')

source=(http://ppa.pysolo.net/pool/main/${pkgname}_${pkgver}.orig.tar.gz ${pkgname}.desktop)
md5sums=('c91c4b747aa858df527b3b2639201eb9' '91592bd8ead236254da26d336ebd9ee3')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/env python/env python2/' pysolo.py pysolo_anal.py pysolo_db.py
  sed -i 's/debian=False/debian=True/' pysolo_path.py
}

package() {
  install -d $pkgdir/usr/share/applications
  install -d $pkgdir/opt/pysolo
  
  cp -r * $pkgdir/opt/pysolo/
  cp $srcdir/*.desktop $pkgdir/usr/share/applications/
}

