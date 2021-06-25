# Maintainer: willemw <willemw12@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=podget
pkgver=0.8.8
pkgrel=1
pkgdesc="Simple tool to automate downloading of podcasts"
arch=('any')
url="http://podget.sourceforge.net/"
license=("GPL3")
depends=('wget')
source=(https://downloads.sourceforge.net/project/podget/podget/podget-$pkgver/podget-$pkgver.tar.gz)
sha256sums=('54bc846583d06d93aeaf170e0f9ed854bf9a030ce3a6537d68908bb8d3f284d4')

package() {
  install -Dm644 $pkgname-$pkgver/README -t "$pkgdir/usr/share/$pkgname"
  cp -a $pkgname-$pkgver/SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"

  make -C $pkgname-$pkgver prefix=/usr DESTDIR="$pkgdir/" changelog.gz install
}

