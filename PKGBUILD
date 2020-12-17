#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=5up
pkgver=1.7.3b3
pkgrel=1
pkgdesc='Handy screenshot making tool. Take screenshots, crop them, draw on them by using built-in editor and share your screenshots over the Internet by instant upload to img.5cm.ru image hosting server.'
arch=('x86_64')
url='https://launchpad.net/~luza-mbox'
license=('GPL')
depends=('qt4')
makedepends=('lib32-qt4' 'libx11')
conflicts=('5up-bin')
options=(!strip)
source=("https://launchpad.net/~luza-mbox/+archive/ubuntu/ppa/+files/"$pkgname"_"$pkgver".orig.tar.gz")
sha256sums=('08452fee102b49e8f9e3846c5a20bb7b0cdedb77806afa068768def0552a7476')

build() {
     cd "$srcdir"/5up-1.7.3/
     qmake-qt4 && make -j$(nproc)
}

package() {
  install -dm 755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -dm 755 "$pkgdir/usr/bin/"

  install -Dm 755 "$srcdir"/5up-1.7.3/docs/copyright "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm 755 "$srcdir/5up-1.7.3/5up" "$pkgdir"/usr/bin/
}

