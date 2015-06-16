# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidcerts
pkgver=3.8.0.9128
pkgrel=1
pkgdesc="Estonian ID card root, intermediate and OCSP certificates"
arch=('any')
url="http://www.id.ee/"
license=('LGPL')
source=("https://installer.id.ee/media/sources/$pkgname-$pkgver.tar.gz"
        "https://installer.id.ee/media/sources/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('1c3b685b46350a409d209acb93b8966ef2e3ab48526bc5945183d167357b96de'
            'SKIP')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/esteid/certs"
  cp -R *.crt "$pkgdir/usr/share/esteid/certs"
  rm $pkgdir/usr/share/esteid/certs/TEST*
}
