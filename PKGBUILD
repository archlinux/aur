# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xfractint  
pkgver=20.04p16
pkgrel=1
pkgdesc="A fractal generator wellknown from good old DOS days"
url="http://www.fractint.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft')
makedepends=('yasm')
source=(fractint.sh "http://www.fractint.org/ftp/current/linux/$pkgname-$pkgver.tar.gz")
sha256sums=('dc889d2b3655d2d5698ac350de5fe0636d8e23c7d7224b378133012916e3535e'
            '4e5401cfec0e6ffa1dab38e3c177e1445772096cbe554200c512edeea23c47ad')

package() {
  cd $pkgname-$pkgver
  make AS=yasm DESTDIR="$pkgdir"/usr install
  install -Dm755 "$srcdir"/fractint.sh "$pkgdir"/etc/profile.d/xfractint.sh 
}
