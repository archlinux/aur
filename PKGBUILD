# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xfractint  
pkgver=20.04p15
pkgrel=1
pkgdesc="A fractal generator wellknown from good old DOS days"
url="http://www.fractint.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft')
makedepends=('gcc8' 'yasm')
source=(fractint.sh "http://www.fractint.org/ftp/current/linux/$pkgname-$pkgver.tar.gz")
sha256sums=('dc889d2b3655d2d5698ac350de5fe0636d8e23c7d7224b378133012916e3535e'
            'd30e87fa389d6231a7a7948ca69124e202a472317f97b23afe5de62dfd8362f3')

package() {
  cd $pkgname-$pkgver
  make AS=yasm DESTDIR="$pkgdir"/usr install
  install -Dm755 "$srcdir"/fractint.sh "$pkgdir"/etc/profile.d/xfractint.sh 
}
