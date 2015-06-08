# Maintainer: willemw <willemw12@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=podget
pkgver=0.7.6
pkgrel=1
pkgdesc="Simple tool to automate downloading of podcasts"
arch=('any')
url="http://podget.sourceforge.net/"
license=("GPL3")
depends=('wget')
source=(http://downloads.sourceforge.net/project/podget/podget/podget-$pkgver/podget-$pkgver.tar.gz)
md5sums=('af62bc9bf10eeb945e145fbd37eab583')

package() {
  cd $pkgname-$pkgver
  make prefix=/usr DESTDIR="$pkgdir" changelog.gz install
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  cp -a SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"
  find "$pkgdir/usr/share/$pkgname/scripts/" -type d -exec chmod 755 '{}' \;
}

