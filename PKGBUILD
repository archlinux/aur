# Maintainer: ajs124 < aur AT ajs124 DOT de >
# Contributor: rabyte <rabyte__gmail>
# Contributor: maintainer <jellevdwaa__gmail>

pkgname=krank
pkgver=0.7
pkgrel=4
pkgdesc="A billiard-golf-breakout mix"
arch=('any')
url="http://krank.sourceforge.net/"
license=('custom:"Public Domain"')
depends=('python2-pygame' 'python2-numpy')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/${pkgver//.}/$pkgname-${pkgver//.}.tar.bz2
	$pkgname-linux-config+python2.patch
	$pkgname.sh)
sha1sums=('702bfeccf64d626aea4b529155bb131ffc331b16'
	  '0e1da0d31d0727626e85c5990de360077aa92407'
	  '98cedab00867175fa593ebe94ac497727d5bceb7')

prepare() {
  patch -Np0 -i $pkgname-linux-config+python2.patch
}

package() {
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -rf $pkgname-${pkgver//.}/* $pkgdir/usr/share/$pkgname/

  install -Dm755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
}
