# Maintainer: willemw <willemw12@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=podget
pkgver=0.8.10
pkgrel=1
pkgdesc="Simple tool to automate downloading of podcasts"
arch=('any')
url="http://podget.sourceforge.net/"
license=("GPL3")
depends=('wget')
source=(https://downloads.sourceforge.net/project/podget/podget/podget-$pkgver/podget-$pkgver.tar.gz)
sha256sums=('74b7f1e03d23e4ddfecb63fc34b8e279d4847701a2f218df23f7481adc3bde26')

package() {
  install -Dm644 $pkgname-$pkgver/README -t "$pkgdir/usr/share/$pkgname"
  cp -a $pkgname-$pkgver/SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"

  make -C $pkgname-$pkgver prefix=/usr DESTDIR="$pkgdir/" changelog.gz install
}

