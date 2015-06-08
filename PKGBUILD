# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=bindechexascii
pkgver=0.0+20140524.git7dcd86
pkgrel=1
pkgdesc="simple ASCII,binary,decimal and hex converter"
arch=(i686 x86_64)
url="https://packages.debian.org/sid/${pkgname}"
license=('GPL2')
source=("http://ftp.us.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.orig.tar.bz2"
        "fix_makefile.patch::https://raw.githubusercontent.com/marciosouza20/bindechexascii/master/patches/fix_makefile"
        "fix_source_code.patch::https://raw.githubusercontent.com/marciosouza20/bindechexascii/master/patches/fix_source_code")
md5sums=('a2fa24acd96d39c264e99bab86dbcb31'
         '8a33200ffff9b38f13a247ca6e9ecb84'
         '7ccba3a1a8dccb65676a1cb8c791ee81')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../fix_makefile.patch
  patch -p1 -i ../fix_source_code.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
