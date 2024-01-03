# Maintainer: willemw <willemw12@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=podget
pkgver=0.9.3
pkgrel=1
pkgdesc='Simple tool to automate downloading of podcasts'
arch=(any)
url=https://podget.sourceforge.net
license=(GPL3)
depends=(wget)
#source=("https://github.com/dvehrs/podget/archive/refs/tags/v$pkgver.tar.gz")
#source=("https://downloads.sourceforge.net/project/podget/podget/podget-$pkgver/podget-$pkgver.tar.gz")
#source=("https://sourceforge.net/projects/podget/files/podget/podget-${pkgver:0:3}/podget-$pkgver.tar.gz")
source=("https://sourceforge.net/projects/podget/files/podget/podget-$pkgver/podget-$pkgver.tar.gz")
sha256sums=('b7a9e38b046da24e4043f6b737fcece303b151446758d94857361d5b677f1924')

package() {
  install -Dm644 $pkgname-$pkgver/README -t "$pkgdir/usr/share/$pkgname"
  cp -a $pkgname-$pkgver/SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"

  make -C $pkgname-$pkgver prefix=/usr DESTDIR="$pkgdir/" install
}
