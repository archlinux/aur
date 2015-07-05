pkgname=xvba-sdk
pkgver=0.74.404001
pkgrel=2
pkgdesc='XvBA SDK'
arch=(any)
url=http://developer.amd.com/
license=(custom)
source=(${url}wordpress/media/2012/10/$pkgname-${pkgver%.*}-${pkgver##*.}.tar.gz)
sha256sums=(731a2c489f2fb5d7318c1976061b26c1057a696f46d09dcf55fbada97fed17eb)

package() {
  install -d $pkgdir/usr/include
  install -m644 include/amdxvba.h $pkgdir/usr/include
  install -d $pkgdir/usr/include/amd
  ln -rs $pkgdir/usr/include/amdxvba.h $pkgdir/usr/include/amd

  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 doc/* LICENSE README $pkgdir/usr/share/doc/$pkgname

  install -d $pkgdir/usr/share/licenses/$pkgname
  ln -rs $pkgdir/usr/share/doc/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
