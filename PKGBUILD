# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidcerts
pkgver=3.8.2.9210
pkgrel=1
pkgdesc="Estonian ID card root, intermediate and OCSP certificates"
arch=('any')
url="http://www.id.ee/"
license=('LGPL')
source=("https://installer.id.ee/media/ubuntu/pool/main/e/$pkgname/${pkgname}_$pkgver-ubuntu-13-10.tar.gz")
sha256sums=('8036df93116994e8d57b005b1a6e867c8258ddd7a6803a350c0c72e2a3439043')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

package() {
  cd "$srcdir/$pkgname-$pkgver/usr/share/esteid/certs"
  mkdir -p "$pkgdir/usr/share/esteid/certs"
  cp -R *.crt "$pkgdir/usr/share/esteid/certs"
  rm $pkgdir/usr/share/esteid/certs/TEST*
}
